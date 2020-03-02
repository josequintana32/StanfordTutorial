//
//  Concentration.swift
//  StanfordTutorial
//
//  Created by Jose Quintana on 28/02/2020.
//  Copyright © 2020 Kelsus. All rights reserved.
//

import Foundation
class Concentration {
    
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        cards.shuffle()
    }
}
