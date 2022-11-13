//
//  TabItemView.swift
//  Ahlan
//
//  Created by Sumo Hoque on 9/12/22.
//

import SwiftUI

struct TabItemData {
    let image: String
    let selectedImage: String
    let title: String
}

extension Color {
    static let lavendar2 = Color(red: 165 / 255, green: 133 / 255, blue: 228 / 255)
}

struct TabItemView: View {
    let data: TabItemData
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: isSelected ? data.selectedImage : data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
                .foregroundColor(Color.lavendar2)
                .animation(.default)
            
            Spacer().frame(height: 4)
            
            Text(data.title)
                .foregroundColor(isSelected ? .lavendar2 : .lavendar2)
                .font(.system(size: 14))
        }
    }
}

/*struct TabItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabItemView()
    }
}*/
