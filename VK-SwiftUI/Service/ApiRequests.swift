//
//  ApiRequests.swift
//  Vk
//
//  Created by Dmitry Zasenko on 22.09.21.
//

import Foundation
import Alamofire

enum TypeRev: Int {
    case chronological = 0
    case antiСhronological = 1
}

class VKService {
    
    static let session: Session = {
        let config = URLSessionConfiguration.default
        let session = Session(configuration: config)
        return session
    }()
    
    private let baseURL = "https://api.vk.com/method/"
    private let version = "5.131"
    
    private enum Paths: String {
        case getFriends = "friends.get"
        case getGroups = "groups.get"
        case getUserPhotos = "photos.getUserPhotos"
    }
    
    func getFriends(completion: @escaping ((Result<[Friend], Error>) -> Void)) {
        let url = baseURL + Paths.getFriends.rawValue
        let order = "hints"
        let fields = "first_name,last_name,photo_100,city,country,bdate"
        
        let parameters: Parameters = [
            "access_token": MySession.shared.token,
            "v": version,
            "user_id": MySession.shared.userId,
            "order": order,
            "fields": fields
        ]
        
        VKService.session.request(url, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
            case .success( _):
                if let data = response.data {
                    do {
                        var friends = try JSONDecoder().decode(FriendsResponse.self, from: data).response.items
                        
                        friends = friends.filter {
                            $0.deactivated == nil
                        }
                        
                        completion(.success(friends))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
        }
    }

    func getGroups(completion: @escaping ((Result<[Group], Error>) -> Void)) {
        let url = baseURL + Paths.getGroups.rawValue
        let fields = "name,photo_100"
        let extended = "1"
        
        let parameters: Parameters = [
            "access_token": MySession.shared.token,
            "v": version,
            "user_id": MySession.shared.userId,
            "fields": fields,
            "extended": extended
        ]
        
        VKService.session.request(url, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
            case .success( _):
                if let data = response.data {
                    do {
                        let groups = try JSONDecoder().decode(GroupsResponse.self, from: data).response.items
                        completion(.success(groups))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
        }
    }
    
    func getUserPhotos(ownerId: Int, completion: @escaping ((Result<[Photo], Error>) -> Void)) {
        let url = baseURL + Paths.getUserPhotos.rawValue

        let parameters: Parameters = [
            "access_token": MySession.shared.token,
            "v": version,
            "user_id": ownerId,
            "extended": "1",
            "rev": TypeRev.antiСhronological.rawValue,
        ]

        VKService.session.request(url, parameters: parameters).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                completion(.failure(error))
            case .success( _):
                if let data = response.data {
                    do {
                        let photos = try JSONDecoder().decode(RootPhotos.self, from: data).response.items
                        completion(.success(photos))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
        }
    }
}
