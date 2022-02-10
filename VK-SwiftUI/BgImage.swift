//
//  BgImage.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 13.01.22.
//

import SwiftUI

struct BgImage: View {
    
    var body: some View {
        Image("bg")
            .resizable()
            .scaledToFill()
            .frame(height: 140)
            .clipShape(Rectangle())
            .edgesIgnoringSafeArea(.all)
    }
}

struct BgImage_Previews: PreviewProvider {
    static var previews: some View {
        BgImage()
    }
}
