//
//  TabBarView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 14.01.22.
//

import SwiftUI

struct TabBarView: View {
    let vkService = VKService()
    let realmService = RealmService()
    
    @ObservedObject var navigationViewModel: NavigationViewModel
    
    var body: some View {
        
        TabView(selection: $navigationViewModel.tag) {
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
