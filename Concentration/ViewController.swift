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
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchCard(_ sender: UIButton) {
        let cardNumber = cardButtons.firstIndex(of: sender)!
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                if card.isMatched {
                    button.isHidden = true
                }
            }
        }

        if game.gameover {
            cardButtons.forEach({$0.isHidden = false})
            game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
            game.gameover = false
        }
        
        flipCountLabel.text = "Count: \(game.flipCount)"
        
        
    }
    
    var emojiChoices = ["🐼","🐵","🐴","👻","🏀","🦊","💩","💀","🎃","😺"]
    
    var emojiDictionary = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojiDictionary[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
}

