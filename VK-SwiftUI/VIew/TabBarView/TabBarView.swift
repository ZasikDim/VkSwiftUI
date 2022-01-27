//
//  TabBarView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 14.01.22.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selection = 0
    let vkService = VKService()
    let realmService = RealmService()
    
    var body: some View {
        TabView(selection: $selection) {
            FriendsListView(viewModel: FriendsViewModel(realmService: realmService, vkService: vkService))
                .tabItem {
                    Label("Friends", systemImage: "person.circle.fill")
                }
                .tag(0)
            
            GroupsListView(viewModel: GroupsViewModel(realmService: realmService, vkService: vkService))
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
        .navigationBarHidden(true)
        .accentColor(.blue)
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
