//
//  UserView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 13.01.22.
//

import SwiftUI

struct FriendListView: View {
    
    let friend: Friend
    
    @State var animation = false
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(
                url: URL(string: friend.photo),
                content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .modifier(RoundFrameWithShadow(frameColor: .white))
                        .frame(width: 100, height: 100)
                        .scaleEffect(animation ? 1.2 : 1)
                        .animation(.spring(response: 0.2, dampingFraction: 0.19), value: animation)
                        .onTapGesture(count: 1, perform: {
                            animation.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                                animation.toggle()
                            }
                        })
                }, placeholder: {
                    ProgressView()
                }
            )
            
            VStack(alignment: .leading) {
                Text(friend.firstName)
                if let lastName = friend.lastName {
                    Text(lastName)
                }
                if let city = friend.city {
                    HStack {
                        Image(systemName: "house.circle.fill")
                        Text(city.title)
                            .font(Font.system(size: 14, design: .rounded))
                    }.foregroundColor(Color.gray)
                }
            }
            .font(Font.system(size: 20, design: .rounded).bold())
        }
    }
}
