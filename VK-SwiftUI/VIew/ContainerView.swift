//
//  ContainerView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 17.01.22.
//

import SwiftUI

struct ContainerView: View {
    
    @State private var shouldShowMainView: Bool = false
    
    var body: some View {
        
        NavigationView {
            HStack {
                VKLoginWebView(shouldShowMainView: $shouldShowMainView)
                NavigationLink(destination: TabBarView(),
                               isActive: $shouldShowMainView) { EmptyView() }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle("Вход")
            .navigationBarHidden(true)
            
        }
    }
}
