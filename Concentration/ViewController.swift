//
//  ViewController.swift
//  Concentration
//      This application is made for learning iOS development
//      following the open course of Stanford.
//
//  Version 1: Construct the application practicelly.
//
//  Created by Huang Jiaqi on 2019/07/11.
//  Copyright © 2019 Huang Jiaqi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func touchCard(_ sender: UIButton) {
        let cardNumber = cardButtons.firstIndex(of: sender)!
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        
        flipCountLabel.text = "Count: \(game.flipCount)"
        
    }
    
    private var emojiChoices = ["🐼","🐵","🐴","👻","🏀","🦊","💩","💀","🎃","😺"]
    
    private var emojiDictionary = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emojiDictionary[card] == nil, emojiChoices.count > 0 {
            emojiDictionary[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emojiDictionary[card] ?? "?"
    }
    

}

extension Int {
    var arc4random:Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
