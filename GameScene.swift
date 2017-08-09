
//
//  GameScene.swift
//  ERS
//
//  Created by Henry Blair on 8/6/17.
//  Copyright © 2017 Henry Blair. All rights reserved.
//

import SpriteKit
import GameplayKit
struct GameState {
    static var PlayerTurn = 1
    static var Player2Turn = 2
    static var GameOver = 3
}

class GameScene: SKScene {
    var masterZPosition: CGFloat = 5
    
    var state = GameState.PlayerTurn
    var pile = [Card] ()
    var player1Pile = [Card] ()
    var player2Pile = [Card] ()
    var playedPile = [Card] ()
    
    
    override func didMove(to view: SKView) {
        distributeCardsRandomly()
        updateCardUI()
    }
    

    
    func distributeCardsRandomly () {
        for _ in 0 ..< CardCollection.instance.cards.count  {
            player1Pile.append(CardCollection.instance.pickRandomCard())
            player2Pile.append(CardCollection.instance.pickRandomCard())
        }
    }

    func updateCardUI() {
        for card in player1Pile {
            card.removeFromParent()
        }
        /*for card in player2Pile {
            card.removeFromParent()
        }*/

        let playedPileTop = self.childNode(withName: "playedPileTop") as! SKSpriteNode
        let playedPileMiddle = self.childNode(withName: "playedPileMiddle") as! SKSpriteNode
        let playedPileBottom = self.childNode(withName: "playedPileBottom") as! SKSpriteNode
        
        
        let slap = self.childNode(withName: "slap") as! SKSpriteNode
        let waste = self.childNode(withName: "waste") as! SKSpriteNode
        let slap2 = self.childNode(withName: "slap2") as! SKSpriteNode
        let waste2 = self.childNode(withName: "waste2") as! SKSpriteNode
        
        
        
        playedPileTop.alpha = 1
        playedPileMiddle.alpha = 1
        playedPileBottom.alpha = 1
        slap.alpha = 0
        slap2.alpha = 0
        waste.alpha = 1
        waste2.alpha = 1
       
        
        if playedPile.count >= 3 {
            playedPileTop.texture = playedPile.last?.texture //how we get last card//
            playedPileMiddle.texture = playedPile[playedPile.count - 2].texture
            playedPileBottom.texture = playedPile [playedPile.count - 3].texture
            
            if playedPile.last?.value == playedPile[playedPile.count - 2].value {  //slap button appears if sandwhich occurs
                slap.alpha = 1
                slap2.alpha = 1
            }
            else if playedPile.last?.value == playedPile[playedPile.count - 1].value {  //slap button appears if double occurs
                slap.alpha = 1
                slap2.alpha = 1
            }
        }
            
            
            
        else if playedPile.count == 2 {
            playedPileTop.texture = playedPile.last?.texture
            playedPileMiddle.texture = playedPile[playedPile.count - 2].texture
            playedPileBottom.alpha = 0
            
            if playedPile.last?.value == playedPile[playedPile.count - 1].value {  //slap button appears if double occurs
                slap.alpha = 1
                slap2.alpha = 1
                }
        }
            
            
            
        else if  playedPile.count == 1 {
            playedPileTop.texture = playedPile.last?.texture
            playedPileMiddle.alpha = 0
            playedPileBottom.alpha = 0
        }
        else if playedPile.count == 0 {
            playedPileTop.alpha = 0
            playedPileMiddle.alpha = 0
            playedPileBottom.alpha = 0
        }
        else {}
        
        let playCard1 = self.childNode(withName: "playCard1") as! SKSpriteNode
        if let p1Value = player1Pile.last?.value, let p1Suit = player1Pile.last?.suit {
            playCard1.texture = SKTexture (imageNamed: "\(p1Value) \(p1Suit)") }
        
        let player2Pile = self.childNode(withName: "playCard2") as! SKSpriteNode
        player2Pile.texture = SKTexture (imageNamed: "1 card")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        print ("screen touched")
        let touchLocation = touch.location (in: self)
        for card in player1Pile {
            if card.contains(touchLocation) {
                let i = player1Pile.index(of: card)
                player1Pile.remove(at: i!)
                card.removeFromParent()
                playedPile.append(card)
                print ("card touched")
            }
        }
    }
    
  //lets see if this helps
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
