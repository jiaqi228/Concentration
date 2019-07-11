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
    
    
    let allEmojis = ["👻","🍎","👻","🍎"]
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Count: \(flipCount)"
        }
    }
    
    var flippedCards = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchCard(_ sender: UIButton) {

        flipCard(on: sender)
        flipCount += 1
        
        flippedCards.append(sender)
        
        if(flippedCards.count == 2) {
            if (flippedCards[0].currentTitle == flippedCards[1].currentTitle) {
                for card in flippedCards {
                    card.isHidden = true
                }
            } else {
                for card in flippedCards {
                    flipCard(on: card)
                }
            }
            flippedCards.removeAll()
        }
    }
    
    fileprivate func flipCard(on button: UIButton) {
        let cardNumber = buttons.firstIndex(of: button)!
        
        if(button.currentTitle == nil || button.currentTitle == "") {
            button.setTitle(allEmojis[cardNumber], for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            
            //TODO Here needs animation.
            
        } else {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
    }
    
}

