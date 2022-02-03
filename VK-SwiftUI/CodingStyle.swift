//
//  CodingStyle.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 31.01.22.
//

import Foundation

@propertyWrapper public struct CodingStyle {
    
    public var wrappedValue: String {
        get {
            get()
        }
        set {
            value = newValue
        }
    }
    public enum CodingStyles {
        case camelCase
        case snakeCase
        case kebabCase
    }
    
    private var value: String = ""
    var codingStyle: CodingStyles
    
    public init(wrappedValue: String, codingStyle: CodingStyles) {
        self.value = wrappedValue
        self.codingStyle = codingStyle
    }
    
    private func get() -> String {
        
        var first = value.prefix(1)
        let last = value.dropFirst()
        for ch in last {
            ch.isUppercase ? first.append(contentsOf: " \(ch.lowercased())") :
            {
                ch == "-" || ch == "_" ?
                first.append(" ") :
                first.append(ch)
            }()
        }
        
        switch codingStyle {
        case .camelCase:
            return value.prefix(1) + value
                .capitalized
                .dropFirst()
                .split(separator: " ")
                .joined()
                .split(separator: "-")
                .joined()
                .split(separator: "_")
                .joined()
        case .snakeCase:
            return first
                .split(separator: " ")
                .joined(separator: "_")
                .split(separator: "-")
                .joined(separator: "_")
       
        case .kebabCase:
            return first
                .split(separator: " ")
                .joined(separator: "-")
                .split(separator: "_")
                .joined(separator: "-")
        }
    }
}
