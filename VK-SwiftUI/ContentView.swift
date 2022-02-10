//
//  ContentView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 10.01.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var login: String = ""
    @State private var password: String = ""
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(minWidth: 50, idealWidth: 200, maxWidth: 200, minHeight: 50, idealHeight: 200, maxHeight: 200, alignment: .center)
                        .scaledToFit()
                        .padding()
                    VStack {
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
                        Button(action: {
                            print("Hello")
                            
                        }) {
                            Text("Log in")
                        }
                        .buttonStyle(BlueButton())
                        .padding(.top, 40)
                        .padding(.bottom, 20)
                        .disabled(login.isEmpty || password.isEmpty)
                    }
                    .frame(maxWidth: 300)
                    .padding(20)
                    .background(Color.blue.opacity(0.5))
                    .cornerRadius(24)
                    Spacer()
                    
                }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}
