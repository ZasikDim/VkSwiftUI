//
//  ContainerView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 17.01.22.
//

import SwiftUI

struct ContainerView: View {
    
    @State private var shouldShowMainView: Bool = true
    
    var body: some View {
        
        NavigationView {
            HStack {
                LoginView(isUserLoggedIn: $shouldShowMainView)
                NavigationLink(destination: TabBarView(),
                               isActive: $shouldShowMainView) { EmptyView() }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle("Вход")
            .navigationBarHidden(true)
            
        }
    }
}
