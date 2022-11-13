//
//  SwiftOneView.swift
//  Le Art
//
//  Created by Sumya Hoque on 11/7/22.
//

import SwiftUI
extension Color {
    static let lavendar = Color(red: 212 / 255, green: 201 / 255, blue: 235 / 255)
}
struct SwiftOneView: View {
    let gradient = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: .purple, location: 0),
            .init(color: .clear, location: 0.4)
        ]),
        startPoint: .bottom,
        endPoint: .top
    )
    @State private var showingSheet = false
    var body: some View {
        NavigationView
        {
            GeometryReader {gp in
                ScrollView
                {
                    ZStack
                    {
                        ZStack
                        {
                            Image("Icon")
                                .resizable()
                                .scaledToFit().ignoresSafeArea()
                                .overlay(
                                    Rectangle()
                                        .fill(
                                            LinearGradient(gradient: Gradient(stops: [
                                                .init(color: Color(UIColor.systemBackground).opacity(0.01), location: 0),
                                                .init(color: Color(UIColor.systemBackground), location: 1)
                                            ]), startPoint: .top, endPoint: .bottom)
                                        ).frame(height: 0.5 * gp.size.width)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .allowsHitTesting(false).padding(.top, 225)
                                )
                        }
                        LazyVStack(alignment:.leading, spacing:-15)
                        {
                            Text("Lorem ipsum dolor sit amet consectetur | adipiscing elit").font(.largeTitle).fontWeight(.semibold).padding(.horizontal)
                            Button {
                                showingSheet.toggle()
                            } label: {
                                Image("PlayButton").resizable()
                                    .scaledToFit().frame(width: 200, height: 100, alignment: .center)
                                    .clipped()
                            }.sheet(isPresented: $showingSheet) {
                                SwiftThreeView().preferredColorScheme(.dark)
                        }
                       
                    }.padding(.top, 300)
                    }
                    ForEach(0..<100) { i in
                        HStack
                        {
                            LazyVStack(alignment: .leading)
                            {
                                Text("Title \(i+1)").multilineTextAlignment(.leading).padding([.top, .leading])
                            }
                            LazyVStack(alignment: .trailing)
                            {
                                NavigationLink {
                                    SwiftTwoView()
                                } label: {
                                    Text("View All").multilineTextAlignment(.trailing).padding(.trailing)
                                }
                            }
                        }
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                
                                ForEach(0..<100) { index in
                                    Button {
                                        showingSheet.toggle()
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
                                    }.sheet(isPresented: $showingSheet) {
                                        SwiftThreeView().preferredColorScheme(.dark)
                                    }
                                    
                                    
                                }
                            }
                        }.padding()
                        //Spacer()
                    }
                    }
                    
            }.navigationTitle("Le RackTangles")
        }
    }
    struct SwiftOneView_Previews: PreviewProvider {
        static var previews: some View {
            SwiftOneView().preferredColorScheme(.dark)
        }
    }
}
