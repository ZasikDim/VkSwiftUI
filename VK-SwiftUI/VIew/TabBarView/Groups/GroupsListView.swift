//
//  GroupView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 13.01.22.
//

import SwiftUI

struct GroupsListView: View {
    
    @ObservedObject var viewModel: GroupsViewModel
    
    init(viewModel: GroupsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        List(viewModel.detachedGroups) { group in
            GroupListView(group: group)
                .padding(.vertical)
        }
        .onAppear {
            viewModel.getGroups()
        }
    }
}
