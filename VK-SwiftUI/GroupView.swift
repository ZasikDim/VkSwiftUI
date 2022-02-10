//
//  GroupView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 13.01.22.
//

import SwiftUI

struct GroupView: View {
    var body: some View {
        VStack{
            BgImage()
            
            Image("groupPhoto")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .modifier(RoundFrameWithShadow(frameColor: .white))
                .offset(y: -100)
                .padding(.bottom, -100)
            
            VStack(alignment: .center) {
                Text("Photography")
                    .font(Font.system(size: 20, design: .rounded).bold())

                Text("Documentary, Street Photography")
                    .font(Font.system(size: 16, design: .rounded))
                    .foregroundColor(Color.gray)

                Text("Основная проблема фотографии в том, что её слишком много, просто чудовищно много. Как если бы всё население планеты писало маслом или сочиняло стихи. Возможно ли в этом океане посредственного отыскать несколько капель настоящего, да и кому это по силам?")
                    .padding(.top, 20)
                
            }
            .padding([.leading, .trailing])
            
            Spacer()
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
