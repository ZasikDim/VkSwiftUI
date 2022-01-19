//
//  UserView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 13.01.22.
//

import SwiftUI

struct FriendListView: View {
    
    @State private var isOnline: Bool = true
    
    let friend: Friend
    
    var body: some View {
            HStack(spacing: 20) {
                AsyncImage(
                    url: URL(string: friend.photo),
                    content: { image in
                        image.resizable()
                            .resizable()
                            .scaledToFill()
                            
                            .modifier(RoundFrameWithShadow(frameColor: .white))
                    }, placeholder: {
                        ProgressView()
                            
                    }
                ).frame(width: 100, height: 100)
                
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(friend.firstName)
                        Text(friend.lastName)
                    }
                    .font(Font.system(size: 20, design: .rounded).bold())
                    HStack {
                        Image(systemName: "house.circle.fill")
                        Text(friend.homeTown)
                            .font(Font.system(size: 16, design: .rounded))
                            
                    }.foregroundColor(Color.gray)
                    
                    if friend.isOnline {
                        Text("online")
                            .font(Font.system(size: 12, design: .rounded))
                            .foregroundColor(Color.green)
                    }
                }
                Spacer()
            }
            .padding(.vertical)
    }
}
