//
//  BoardViewModel.swift
//  game44
//
//  Created by Leo Lopez on 13/1/22.
//

import Foundation
import UIKit

class BoardViewModel: ObservableObject {
    // MARK: - Variables
    @Published var board: [BoardItem]
    @Published var playerOne: Player
    @Published var playerTwo: Player
    @Published var currentPlayer: Int // Numeros pares = rojo, numeros impares = amarillo
    @Published var totalGame: Int
   
    // MARK: - Enums
    
    // MARK: - Struct
    
    // MARK: - Constructor and deinit
    init() {
        self.playerOne = Player(id: "1", name: "Rojo", color: UIColor.red, win: 0)
        self.playerTwo = Player(id: "2", name: "Amarillo", color: UIColor.yellow, win: 0)
        self.currentPlayer = 0 // Siempre inicia rojo
        self.totalGame = 0
        self.board = []
    }
    
    // MARK: - Public methods
    public func generateBoard() {
        let board = [
            BoardItem(id: 1, row: 0, column: 0, player: nil),
            BoardItem(id: 2, row: 0, column: 1, player: nil),
            BoardItem(id: 3, row: 0, column: 2, player: nil),
            BoardItem(id: 4, row: 0, column: 3, player: nil),
            BoardItem(id: 5, row: 0, column: 4, player: nil),
            BoardItem(id: 6, row: 0, column: 5, player: nil),
            BoardItem(id: 37, row: 0, column: 6, player: nil),
            
            BoardItem(id: 7, row: 1, column: 0, player: nil),
            BoardItem(id: 8, row: 1, column: 1, player: nil),
            BoardItem(id: 9, row: 1, column: 2, player: nil),
            BoardItem(id: 10, row: 1, column: 3, player: nil),
            BoardItem(id: 11, row: 1, column: 4, player: nil),
            BoardItem(id: 12, row: 1, column: 5, player: nil),
            BoardItem(id: 38, row: 1, column: 6, player: nil),
            
            BoardItem(id: 13, row: 2, column: 0, player: nil),
            BoardItem(id: 14, row: 2, column: 1, player: nil),
            BoardItem(id: 15, row: 2, column: 2, player: nil),
            BoardItem(id: 16, row: 2, column: 3, player: nil),
            BoardItem(id: 17, row: 2, column: 4, player: nil),
            BoardItem(id: 18, row: 2, column: 5, player: nil),
            BoardItem(id: 39, row: 2, column: 6, player: nil),
            
            BoardItem(id: 19, row: 3, column: 0, player: nil),
            BoardItem(id: 20, row: 3, column: 1, player: nil),
            BoardItem(id: 21, row: 3, column: 2, player: nil),
            BoardItem(id: 22, row: 3, column: 3, player: nil),
            BoardItem(id: 23, row: 3, column: 4, player: nil),
            BoardItem(id: 24, row: 3, column: 5, player: nil),
            BoardItem(id: 40, row: 3, column: 6, player: nil),
            
            BoardItem(id: 25, row: 4, column: 0, player: nil),
            BoardItem(id: 26, row: 4, column: 1, player: nil),
            BoardItem(id: 27, row: 4, column: 2, player: nil),
            BoardItem(id: 28, row: 4, column: 3, player: nil),
            BoardItem(id: 29, row: 4, column: 4, player: nil),
            BoardItem(id: 30, row: 4, column: 5, player: nil),
            BoardItem(id: 41, row: 4, column: 6, player: nil),
            
            BoardItem(id: 31, row: 5, column: 0, player: nil),
            BoardItem(id: 32, row: 5, column: 1, player: nil),
            BoardItem(id: 33, row: 5, column: 2, player: nil),
            BoardItem(id: 34, row: 5, column: 3, player: nil),
            BoardItem(id: 35, row: 5, column: 4, player: nil),
            BoardItem(id: 36, row: 5, column: 5, player: nil),
            BoardItem(id: 42, row: 5, column: 6, player: nil)
        ]
        self.board = board
    }
    
    public func resetCurrentGame() {
        generateBoard()
    }
    
    public func resetAllGame() {
        self.currentPlayer = 0
        self.totalGame = 0
        self.playerOne.resetWin()
        self.playerTwo.resetWin()
        
        generateBoard()
    }
    
    public func setPosition(item: BoardItem) {
        if board.filter({ $0.player != nil }).count == board.count {
            totalGame += 1
            currentPlayer = 0
            generateBoard()
        } else {
            if currentPlayer % 2 == 0 { // Rojo
                updateBoard(player: playerOne, item: item)
            } else { // Amarillo
                updateBoard(player: playerTwo, item: item)
            }
            currentPlayer += 1
        }
    }
    
    // MARK: - Private methods
    private func updateBoard(player: Player, item: BoardItem) {
        if board.firstIndex(where: { $0.id == item.id }) != nil {
            if let lastItemAvailbleIndex = board.lastIndex(where: { $0.column == item.column && $0.player == nil }) {
                board[lastItemAvailbleIndex].setPlayer(player)
            }
        }
    }
}
