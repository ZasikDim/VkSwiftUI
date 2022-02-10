//
//  FriendView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 18.01.22.
//

import SwiftUI
//import ASCollectionView

struct FriendView: View {
    
    @ObservedObject var viewModel = FriendViewModel(vkService: VKService())
    let friend: Friend
    
    private let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity))
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    if let photos = viewModel.photos {
                        ForEach(photos) { photo in
                            PhotoView(photo: photo)
                                .frame(height: geometry.size.width / 2)
                        }
                    }
                }//- LazyVGrid
                .onAppear {
                    viewModel.getPhotos(for: friend)
                }
            }//-ScrollView
            .navigationTitle("Фотографии")
            .navigationBarTitleDisplayMode(.inline)
        }//-GeometryReader
    }//-View
}

//struct FriendView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendView()
//    }
//}
