//
//  UserView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 13.01.22.
//

import SwiftUI

struct UserView: View {
    
    @State private var isOnline: Bool = true
    
    var body: some View {
        VStack{
            HStack(spacing: 20) {
                Image("userPhoto")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .modifier(RoundFrameWithShadow(frameColor: .white))
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text("Вася")
                        Text("Пупкин")
                    }
                    .font(Font.system(size: 20, design: .rounded).bold())
                    HStack {
                        Image(systemName: "house.circle.fill")
                        Text("Москва")
                            .font(Font.system(size: 16, design: .rounded))
                            
                    }.foregroundColor(Color.gray)
                    
                    if isOnline {
                        Text("online")
                            .font(Font.system(size: 12, design: .rounded))
                            .foregroundColor(Color.green)
                    } else {
                        Text("offline")
                            .font(Font.system(size: 12, design: .rounded))
                            .foregroundColor(Color.gray)
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
