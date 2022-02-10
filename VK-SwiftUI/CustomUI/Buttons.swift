//
//  Buttons.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 11.01.22.
//

import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 150))
            .font(.headline)
            .foregroundColor(.white)
            .clipShape(Capsule()) 
    }
}
