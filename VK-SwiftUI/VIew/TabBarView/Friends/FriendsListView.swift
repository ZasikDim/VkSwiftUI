//
//  FriendsListView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 14.01.22.
//

import SwiftUI

struct FriendsListView: View {
    
    var friendsArray: [Friend]
    
    @State private var groupedArray: [String: [Friend]] = [:]
    
    init() {
        friendsArray = [
            Friend(firstName: "Иван", lastName: "Ургант", photo: "https://r.mt.ru/r7/photoB116/20308578341-0/jpg/bp.jpeg", allPhotos: nil, homeTown: "Санкт Петербург", isOnline: false),
            Friend(firstName: "Алла", lastName: "Пугачева", photo: "https://krasotamira.com/wp-content/uploads/2018/12/crufoto1543996744_9557423t1h0506.jpg", allPhotos: nil, homeTown: "Москва", isOnline: true),
            Friend(firstName: "Николай", lastName: "Валуев", photo: "https://bryansktoday.ru/uploads/common/34b062f604096ed2_XL.jpg", allPhotos: nil, homeTown: "Москва", isOnline: false)
            ,Friend(firstName: "Мардж", lastName: "Симпсон", photo: "https://slovnet.ru/wp-content/uploads/2018/12/4-63-300x300.jpg", allPhotos: nil, homeTown: "Спрингфилд", isOnline: true)
            ,Friend(firstName: "Алиса", lastName: "Фрейндлих", photo: "https://img51994.domkino.tv/img/2021-01-25/fmt_96_24_33e1a4abdb2e73e0b71c75f927bbe596_cropped_932x734.jpg", allPhotos: nil, homeTown: "Москва", isOnline: false)
            ,Friend(firstName: "Nicki", lastName: "Minaj", photo: "https://s7.vcdn.biz/static/f/2316051331/image.jpg", allPhotos: nil, homeTown: "Brooklyn", isOnline: false)
        ]
    }
    
    var body: some View {
            List {
                ForEach(groupedArray.keys.sorted(), id: \.self) {key in
                    Section(header: Text(key)) {
                        ForEach(groupedArray[key] ?? [], id: \.self) {value in
                            NavigationLink(destination: FriendView(friend: value)) {
                                        FriendListView(friend: value)
                            }
                                    }
                                }
                            }
            }
            .navigationTitle("Friends")
            //.navigationBarBackButtonHidden(true)
            .listStyle(GroupedListStyle())
            .onAppear {
                groupedArray = Dictionary(
                    grouping: friendsArray,
                    by: {$0.firstName.prefix(1).uppercased()}
                )
            }
  
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
