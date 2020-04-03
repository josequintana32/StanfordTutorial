//
//  ViewController.swift
//  StanfordTutorial
//
//  Created by Jose Quintana on 28/02/2020.
//  Copyright © 2020 Kelsus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        get {
            return (buttonsCollection.count + 1) / 2
        }
    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flip: \(String(flipCount))"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var buttonsCollection: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction private func touchButton(_ sender: UIButton) {

        if let cardNumber = buttonsCollection.firstIndex(of: sender) {
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            flipCount += 1
        } else {
            print("not setted")
        }
    }
    
    private func updateViewFromModel() {
        for index in buttonsCollection.indices {
            let button = buttonsCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["🎃", "☠️", "🖤", "🕸", "🕷", "👽", "💀", "🤡"]
    
    private var emojiDictionary = [Int: String]()
    
    private func emoji (for card: Card) -> String {
        
        if (emojiDictionary[card.identifier] == nil), (emojiChoices.count > 0) {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojiDictionary[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        return emojiDictionary[card.identifier] ?? "?"
    }
}

 
