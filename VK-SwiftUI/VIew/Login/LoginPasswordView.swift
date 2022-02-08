//
//  ContainerView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 17.01.22.
//

import SwiftUI

struct LoginPasswordView: View {
    
    @Binding var login: String
    @Binding var password: String
    
    var body: some View {
        
        HStack {
            Text("Login:")
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
            TextField("", text: $login)
                .frame(maxWidth: 200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        HStack {
            Text("Password:")
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
            SecureField("", text: $password)
                .frame(maxWidth: 200)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
