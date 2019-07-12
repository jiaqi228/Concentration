//
//  Card.swift
//  Concentration
//
//  Created by Huang Jiaqi on 2019/07/11.
//  Copyright © 2019 Huang Jiaqi. All rights reserved.
//

import Foundation

// Model
struct Card: Hashable {
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        identifier = Card.getUniqueIdentifier()
    }
}
