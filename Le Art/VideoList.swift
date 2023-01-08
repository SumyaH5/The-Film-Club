//
//  VideoList.swift
//  Le Art
//
//  Created by First Last on 1/8/23.
//

import SwiftUI

struct VideoList: View {
    let gradient = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: .purple, location: 0),
            .init(color: .clear, location: 0.4)
        ]),
        startPoint: .bottom,
        endPoint: .top
    )
    
    let jsonData = try! String(contentsOfFile: Bundle.main.path(forResource: "files", ofType: "json")!).data(using: .utf8);
    // replace title with jsonData.title in loop below
    // pass selected video index to viewer (SwiftThreeView) so that it can pull the title, source and any other info it needs
        
    @State private var showingSheet = false
    var body: some View {
        NavigationView
        {
            GeometryReader {gp in
                ScrollView
                {
                    ForEach(0..<2) { i in
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
                                Text("title \(i+1)").font(.largeTitle).fontWeight(.semibold).padding(.horizontal)
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
