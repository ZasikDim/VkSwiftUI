//
//  ViewModifier.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 13.01.22.
//

import SwiftUI

struct RoundFrameWithShadow: ViewModifier {
    
    let frameColor: Color
    
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .shadow(radius: 4)
            .overlay(Circle().stroke(frameColor, lineWidth: 4))
    }
}
