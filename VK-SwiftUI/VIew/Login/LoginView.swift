//
//  ContentView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 10.01.22.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @State private var login: String = ""
    @State private var password: String = ""
    
    @State private var showIncorrentCredentialsWarning = false
    @Binding var isUserLoggedIn: Bool
    
    @CodingStyle(codingStyle: .camelCase) private var camelCaseString = "Введите логин и пароль:"
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification).map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification).map { _ in false }
    ).removeDuplicates()
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Image("logo")
                            .resizable()
                            .frame(minWidth: 50, idealWidth: 200, maxWidth: 200, minHeight: 50, idealHeight: 200, maxHeight: 200, alignment: .center)
                            .scaledToFit()
                            .padding()
                        VStack {
                            Text(camelCaseString)
                            LoginPasswordView(login: $login, password: $password)
                            Button(action: {
                                let loginData = verifyLoginData(login: login, password: password)
                                showIncorrentCredentialsWarning = !loginData
                                isUserLoggedIn = loginData
                            }, label: {
                                Text("Log in")
                            })
                            .buttonStyle(BlueButton())
                            .padding(.top, 40)
                            .padding(.bottom, 20)
                            .disabled(login.isEmpty || password.isEmpty)
                        }
                        .frame(maxWidth: 300)
                        .padding(20)
                        .background(Color.blue.opacity(0.5))
                        .cornerRadius(24)
                    }
                }.onTapGesture {
                    UIApplication.shared.endEditing()
                }.alert(isPresented: $showIncorrentCredentialsWarning, content: {
                    Alert(title: Text("Error"),
                          message: Text("Incorrent Login/Password was entered"),
                          dismissButton: .default(Text("Ok"), action: clearAll))
                })
            )
    }
    
    private func verifyLoginData(login: String, password: String) -> Bool {
        return login == "Admin" && password == "Admin"
    }
    
    private func clearAll() {
        password = ""
        login = ""
    }
}
