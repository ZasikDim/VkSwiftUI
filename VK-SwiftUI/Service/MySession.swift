//
//  MySession.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 24.01.22.
//

class MySession {
    static let shared = MySession()
    
    var token: String = ""
    var userId: String = ""
    
    private init (){}
}
