//
//  DetailPhotoView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 31.01.22.
//

import SwiftUI
import Kingfisher

struct DetailPhotoView: View {
    
    let photo: Photo
    @State var isLike: Bool = false
    
    init (photo: Photo) {
        self.photo = photo
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                if let url = photo.averageSize {
                    KFImage(URL(string: url))
                        .cancelOnDisappear(true)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .padding()
                }
            }
            Spacer()
    
            HStack {
                Spacer()
                HStack {
                    HeartButton(isLiked: $isLike)
                    Text("\(photo.getLikesCount)")
                }.onTapGesture {
                        isLike.toggle()
                }
                Spacer()
                HStack {
                    Image(systemName: "text.bubble")
                    Text("\(photo.getCommentsCount)")
                }
                Spacer()
            }
            .padding(10)
        }
    }
}
