//
//  BoardView.swift
//  game44
//
//  Created by Leo Lopez on 10/1/22.
//

import SwiftUI

struct BoardView: View {
    private let columnsItemLayout = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    private let nItems = (0...41)
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    VStack {
                        // Current user indicator and statistics
                    }.frame(height: 96)
                    Spacer()
                    
                    LazyVGrid(columns: columnsItemLayout, alignment: .center, spacing: 0) {
                        ForEach(nItems, id: \.self) { column in
                            VStack {
                                Circle()
                                    .fill(Color.white)
                                    .padding(2)
                            }
                            .frame(width: geometry.size.width / 7)
                            .padding(0)
                        }.frame(height: (geometry.size.height * 0.6) / 6)
                    }.background(.gray)
                    
                    Spacer()
                    VStack {
                        // Players and reset button
                    }
                }
            }
            
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
