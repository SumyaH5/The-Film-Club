//
//  SearchView.swift
//  Le Art
//
//  Created by Sumya Hoque on 11/8/22.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String
    @State var searchText = " "
    @State private var isEditing = false
    var body: some View {
        HStack {
 
            TextField("Search...", text: $text).foregroundColor(Color.black)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color.lavendar2)
                .cornerRadius(10).overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel").foregroundColor(Color.lavendar2)
                }
                .padding(.trailing, 25)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
        
    }
}

struct ListView: View {
    @State var searchText = " "
    var body: some View {
        NavigationView {
           
            VStack
            {
                SearchView(text: $searchText)
                    .padding(.top, 10)
                SwiftTwoView()
                .navigationBarTitle("All Recipes")
            }
            
        }
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
