//
//  GridItem.swift
//  game44
//
//  Created by Leo Lopez on 26/1/22.
//

import Foundation

struct BoardItem: Hashable {
    let id: Int
    let row: Int
    let column: Int
    var player: Player?
    
    mutating func setPlayer(_ player: Player) {
        self.player = player
    }
}
