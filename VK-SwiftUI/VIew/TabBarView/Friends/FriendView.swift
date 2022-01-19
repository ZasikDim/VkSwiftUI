//
//  FriendView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 18.01.22.
//

import SwiftUI

struct FriendView: View {
    
    let friend: Friend
    
    var body: some View {
        VStack{
  //          BgImage()
            
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
            ).frame(width: 200, height: 200)
                
            
            VStack(alignment: .center) {
                Text(friend.firstName)
                    .font(Font.system(size: 20, design: .rounded).bold())
                
                Text(friend.lastName)
                    .font(Font.system(size: 16, design: .rounded))
                    .foregroundColor(Color.gray)
                
                Text(friend.homeTown)
                    .padding(.top, 20)
                
            }
            .padding([.leading, .trailing])
            
            Spacer()
        }
    }
}

//struct FriendView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendView()
//    }
//}
