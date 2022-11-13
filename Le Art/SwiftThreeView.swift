//
//  SwiftThreeView.swift
//  Le Art
//
//  Created by Sumya Hoque on 11/8/22.
//

import SwiftUI

struct SwiftThreeView: View {
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack
        {
            ZStack
            {
                Rectangle().foregroundColor(Color.lavendar).frame(height: 250)
                Image("Icon").resizable()
                    .scaledToFit()
                    .frame(height: 250)
            }
            
            LazyVStack(alignment:.leading)
            {
                Text("Lorem ipsum dolor sit amet consectetur | adipiscing elit").font(.title).fontWeight(.semibold).padding()
                
                ScrollView{

                    Text("Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa").padding(.horizontal)
                            .lineLimit(isExpanded ? nil : 3)
                                GeometryReader { proxy in
                                    Button(action: {
                                        isExpanded.toggle()
                                    }) {
                                        Text(isExpanded ? "Less" : "More").bold()
                                            .padding(.trailing, 330)
                                            .padding(.top, 10.0)
                                    }
                                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                                }
                            
                    }
            }
            Spacer()
            
            LazyVStack(alignment:.leading)
            {
                Text("See More").fontWeight(.semibold).padding(.horizontal)
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        
                        ForEach(0..<100) { index in
                            Button {
                                
                            } label: {
                                ZStack
                                {
                                    Rectangle()
                                        .foregroundColor(Color.lavendar)
                                        .frame(width: 200, height: 100)
                                    Image("Icon").resizable()
                                        .scaledToFit()
                                        .frame(height: 100)
                                }
                                
                            }
                        }
                    }
                }.padding([.horizontal, .bottom])
            }
        }
    }
}

struct SwiftThreeView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftThreeView().preferredColorScheme(.dark)
    }
}
