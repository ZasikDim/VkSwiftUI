//
//  GroupView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 13.01.22.
//

import SwiftUI

struct GroupsListView: View {
    
    var groupArray: [Group]
    
    init() {
    groupArray = [
        Group(name: "Photography", info: "Documentary, Street Photography", description: "Основная проблема фотографии в том, что её слишком много, просто чудовищно много. Как если бы всё население планеты писало маслом или сочиняло стихи. Возможно ли в этом океане посредственного отыскать несколько капель настоящего, да и кому это по силам?", photo: "https://expertphotography.b-cdn.net/wp-content/uploads/2011/11/photography-beginners-image1.jpg"),
        Group(name: "Новая Музыка 2022", info: "Первая сольная композиция Anna Asti - «Феникс» уже в группе. Будь вкурсе всех новинок и подпишись на нас😉", description: "Знакомим вас с самыми первыми новинками 2022 года! Anna Asti - «Феникс», Лёша Свик «Плакала» и многих других. \n\n Топ-Чарты со всего интернета и крупнейших радиостанций страны! \n\nСпасибо огромное, каждому нашему участнику, что подписались на сообщество😉", photo: "https://sun6-23.userapi.com/impg/Kro0SUp-ItghEG0nCBmoUDGJepCSn0hFER8fSw/hhqSqRUu2n4.jpg?size=1000x1000&quality=95&sign=43805fa69cf30bc8665f563171261449&type=album")
    ]
    }
    
    var body: some View {
        
        VStack {
                List {
                    ForEach(groupArray) { group in
                       GroupListView(group: group)
                    }
                }
                .navigationTitle("Community")
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsListView()
    }
}
