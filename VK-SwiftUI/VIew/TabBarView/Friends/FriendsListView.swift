//
//  FriendsListView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 14.01.22.
//

import SwiftUI

struct FriendsListView: View {

    @ObservedObject var viewModel: FriendsViewModel
    
    init(viewModel: FriendsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            List(viewModel.detachedFriends) { friend in
                NavigationLink(destination: FriendView(friend: friend)) {
                    FriendListView(friend: friend)
                        .padding(.vertical)
                }
            }
            .onAppear {
                viewModel.getFriends()
            }
        }
    }
}
