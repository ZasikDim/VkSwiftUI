//
//  FriendView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 18.01.22.
//

import SwiftUI
import ASCollectionView

struct FriendView: View {
    
    @ObservedObject var viewModel = FriendViewModel(vkService: VKService())
    let friend: Friend
    
    var body: some View {
        ASCollectionView(data: viewModel.photos) { (photo, context) in
            NavigationLink(destination: DetailPhotoView(photo: photo))
            {
                PhotoView(photo: photo)
            }
        }
        .layout {
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            let width = UIScreen.main.bounds.width / 2
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: width, height: width)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            layout.scrollDirection = .vertical
            return layout
        }
        .onAppear {
            viewModel.getPhotos(for: friend)
        }
        .navigationTitle("Фотографии")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct FriendView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendView()
//    }
//}
