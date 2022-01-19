//
//  TabBarView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 14.01.22.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            FriendsListView()
                .tabItem {
                    Label("Friends", systemImage: "person.circle.fill")
                }
                .tag(0)
            GroupsListView()
                .tabItem {
                    Label("Community", systemImage: "network")
                }
                .tag(1)
            NewsView()
                .tabItem {
                    Label("News", systemImage: "newspaper.circle.fill")
                }
                .tag(2)
        }
        .accentColor(.blue)
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
            
        }
        .navigationViewStyle(.stack)
        .navigationTitle("Вход")
        .navigationBarHidden(true)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
        
    }
}
