//
//  MainView.swift
//  Ahlan
//
//  Created by Sumo Hoque on 9/12/22.
//.

import SwiftUI

enum TabType: Int, CaseIterable {
    case home 
    case myRec
    

    var tabItem: TabItemData {
        switch self {
        case .home:
            return  TabItemData(image: "play.circle", selectedImage: "play.circle.fill", title: "Watch")
        case .myRec:
            return TabItemData(image: "magnifyingglass.circle", selectedImage: "magnifyingglass.circle.fill", title: "Search")
        }
    }
}
struct MainView: View {
    @State var selectedIndex: Int = 0
    
    var body: some View {
        CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
            let type = TabType(rawValue: index) ?? .home
            getTabView(type: type)
        }
    }
    
    @ViewBuilder
    func getTabView(type: TabType) -> some View {
        switch type {
        case .home:
            SwiftOneView().preferredColorScheme(.dark)
        case .myRec:
            ListView().preferredColorScheme(.dark)
        }
    }
}
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().preferredColorScheme(.dark)
    }
}
