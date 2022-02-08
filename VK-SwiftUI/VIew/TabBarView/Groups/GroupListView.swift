//
//  GroupListView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 14.01.22.
//

import SwiftUI

struct GroupListView: View {
    
    let group: Group
    
    var body: some View {
        VStack{
            HStack(spacing: 20) {
                AsyncImage(
                    url: URL(string: group.photo),
                    content: { image in
                        image.resizable()
                            .resizable()
                            .scaledToFill()
                            .modifier(RoundFrameWithShadow(frameColor: .white))
                    }, placeholder: {
                        ProgressView()
                        
                    }
                ).frame(width: 100, height: 100)
                
                Text(group.name)
                    .font(Font.system(size: 20, design: .rounded).bold())
                
            }
        }
    }
}
