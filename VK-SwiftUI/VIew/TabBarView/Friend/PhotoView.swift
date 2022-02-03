//
//  PhotoView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 31.01.22.
//

import SwiftUI
import Kingfisher

struct PhotoView: View {
    
    let photo: Photo
    var contentMode = ContentMode.fill
    
    var body: some View {
        if let url = photo.averageSize {
            GeometryReader { _ in
                KFImage(URL(string: url))
                    .cancelOnDisappear(true)
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
            }
            .clipped()
        }
    }
}
