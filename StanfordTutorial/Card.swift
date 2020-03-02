//
//  Card.swift
//  StanfordTutorial
//
//  Created by Jose Quintana on 28/02/2020.
//  Copyright © 2020 Kelsus. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueId() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueId()
    }
}
