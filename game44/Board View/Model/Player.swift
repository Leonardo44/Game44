//
//  Player.swift
//  game44
//
//  Created by Leo Lopez on 13/1/22.
//

import Foundation
import UIKit

struct Player: Hashable {
    let id: String
    let name: String
    let color: UIColor
    var win: Int
    
    mutating func setWin() {
        self.win += 1
    }
    
    mutating func resetWin() {
        self.win = 0
    }
}
