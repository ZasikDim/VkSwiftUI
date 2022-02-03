//
//  HeartButton.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 01.02.22.
//

import SwiftUI

struct HeartButton: View {
    
    @Binding var isLiked: Bool
    
    var body: some View {
        
        Button {
            self.isLiked.toggle()
        } label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .foregroundColor(isLiked ? .red : .gray)
                .scaleEffect(isLiked ? 1.1 : 0.9)
                .animation(.easeIn, value: isLiked)
            
        }

    }
}
