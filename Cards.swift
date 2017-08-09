//
//  Cards.swift
//  PalaceCardGame
//
//  Created by iD Student on 7/24/17.
//  Copyright © 2017 iD Blair. All rights reserved.
//

import Foundation
import SpriteKit


class Card: SKSpriteNode {
    var value: Int
    var suit: String
    init (_ value: Int, _ suit: String) {
        self.value = value //class value = self.value and parameter value = value//
        self.suit = suit
        super.init(texture: SKTexture(imageNamed: "\(value) \(suit)"), color: UIColor.clear, size: CGSize (width:145, height: 200))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class CardCollection {
    static var instance = CardCollection ()
    var cards: [Card]
    private init () {
        cards = [
            
            Card (2, "Diamond"),
            Card (3, "Diamond"),
            Card (4, "Diamond"),
            Card (5, "Diamond"),
            Card (6, "Diamond"),
            Card (7, "Diamond"),
            Card (8, "Diamond"),
            Card (9, "Diamond"),
            Card (10, "Diamond"),
            Card (11, "Diamond"),
            Card (12, "Diamond"),
            Card (13, "Diamond"),
            Card (14, "Diamond"),
            Card (2, "Heart"),
            Card (3, "Heart"),
            Card (4, "Heart"),
            Card (5, "Heart"),
            Card (6, "Heart"),
            Card (7, "Heart"),
            Card (8, "Heart"),
            Card (9, "Heart"),
            Card (10, "Heart"),
            Card (11, "Heart"),
            Card (12, "Heart"),
            Card (13, "Heart"),
            Card (14, "Heart"),
            Card (2, "Club"),
            Card (3, "Club"),
            Card (4, "Club"),
            Card (5, "Club"),
            Card (6, "Club"),
            Card (7, "Club"),
            Card (8, "Club"),
            Card (9, "Club"),
            Card (10, "Club"),
            Card (11, "Club"),
            Card (12, "Club"),
            Card (13, "Club"),
            Card (14, "Club"),
            Card (2, "Spade"),
            Card (3, "Spade"),
            Card (4, "Spade"),
            Card (5, "Spade"),
            Card (6, "Spade"),
            Card (7, "Spade"),
            Card (8, "Spade"),
            Card (9, "Spade"),
            Card (10, "Spade"),
            Card (11, "Spade"),
            Card (12, "Spade"),
            Card (13, "Spade"),
            Card (14, "Spade"),
            Card (1, "BJoker"),
            Card (1, "RJoker"),

   //
        ]
        
    }
    func pickRandomCard () -> Card{
        
        let randomCardIndex = Int (arc4random_uniform(UInt32(cards.count)))
        let card = cards[randomCardIndex]
        
        //cards.remove (at: randomC)
        return card
        
    }
}
