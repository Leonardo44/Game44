//
//  BoardView.swift
//  game44
//
//  Created by Leo Lopez on 10/1/22.
//

import SwiftUI
import Combine

struct BoardView: View {
    // MARK: - MVVM variable
    @ObservedObject var viewModel: BoardViewModel = BoardViewModel()
    
    // MARK: - View variable
    private let columnsItemLayout = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
   
    // MARK: - Body view
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    VStack {
                        HStack {
                            PlayerView(player: viewModel.playerOne)
                                .padding()
                            PlayerView(player: viewModel.playerTwo)
                                .padding()
                        }
                        HStack {
                            Text("Turno")
                            VStack {
                                if viewModel.currentPlayer % 2 == 0 { // Rojo
                                    Circle()
                                        .fill(Color(viewModel.playerOne.color))
                                        .padding(2)
                                        .frame(width: 24, height: 24)
                                } else { // Amarillo
                                    Circle()
                                        .fill(Color(viewModel.playerTwo.color))
                                        .padding(2)
                                        .frame(width: 24, height: 24)
                                }
                            }
                        }
                    }
                    Spacer()
                    
                    LazyVGrid(columns: columnsItemLayout, alignment: .center, spacing: 0) {
                        ForEach(viewModel.board, id: \.self) { item in
                            VStack {
                                
                                Circle()
                                    .fill(Color( item.player?.color ?? UIColor.white))
                                    .padding(2)
                                    .onTapGesture {
                                        if viewModel.winner == nil {
                                            viewModel.setPosition(item: item)
                                        }
                                    }
                            }
                            .frame(width: geometry.size.width / 7)
                            .padding(0)
                        }.frame(height: (geometry.size.height * 0.6) / 6)
                    }.background(.gray)
                    
                    Spacer()
                    VStack {
                       
                        HStack {
                            Text("Ganador")
                            Circle()
                                .fill(Color(viewModel.winner?.color ?? UIColor.white))
                                .padding(2)
                                .frame(width: 24, height: 24)
                        }
                        .opacity( viewModel.winner == nil ? 0 : 1)
                        
                        HStack {
                            Text("Juegos finalizados: ")
                            Text("\(viewModel.totalGame)")
                        }
                        
                        Button("Resetear partida actual") {
                            if viewModel.winner == nil {
                                viewModel.resetCurrentGame()
                            }
                        }
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.mint)
                        .clipShape(Capsule())
                        
                        Button("Resetear todas las partidas") {
                            if viewModel.winner == nil {
                                viewModel.resetAllGame()
                            }
                        }
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color.indigo)
                        .clipShape(Capsule())
                    }
                    
                    
                }
            }
        }
        .onAppear {
            viewModel.generateBoard()
        }
    }
}

struct PlayerView: View {
    var player: Player
    
    var body: some View {
        VStack {
            HStack {
                Text(player.name)
                Spacer()
            }
            HStack {
                Text("Victorias: ")
                Text("\(player.win)")
                Spacer()
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(viewModel: BoardViewModel())
    }
}
