//
//  ViewController.swift
//  StanfordTutorial
//
//  Created by Jose Quintana on 28/02/2020.
//  Copyright © 2020 Kelsus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (buttonsCollection.count + 1) / 2)
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = String(flipCount)
        }
    }
    
    var emojiChoices = ["🎃", "☠️", "☠️", "🎃"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var buttonsCollection: [UIButton]!
    
    @IBAction func touchButton(_ sender: UIButton) {

        if let cardNumber = buttonsCollection.firstIndex(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)

        } else {
            print("not set")

        }
        
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        flipCount += 1

        
        print("emo \(emoji)")
        if (button.currentTitle == emoji) {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

