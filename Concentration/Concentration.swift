//
//  Concentration.swift
//  Concentration
//
//  Created by Huang Jiaqi on 2019/07/11.
//  Copyright © 2019 Huang Jiaqi. All rights reserved.
//

import Foundation

// Model
class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    var gameover = false
    
    var flipCount = 0
    
    func chooseCard(at index: Int){
        flipCount += 1
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Already 1 card is facing up case.
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
                // restart a new game
                if cards.allSatisfy({$0.isMatched}) {
                    faceDownAllCards()
                    gameover = true
                }
                
            } else {
                // None or two cards are facing up case.
                faceDownAllCards()
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    private func faceDownAllCards() {
        for index in cards.indices {
            cards[index].isFaceUp = false
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        //Shuffle cards
        cards.shuffle()
    }
}
