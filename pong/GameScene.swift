//
//  GameScene.swift
//  FinnaSphere
//
//  Created by Matias Ortiz on 5/6/18.
//  Copyright © 2018 Matias Ortiz. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
      var enemy = SKSpriteNode()
      var player = SKSpriteNode()
    var scoreplayer = 0
    var scoreenemy = 0
    var toplabel = SKLabelNode()
    var bottomlabel = SKLabelNode()
    var enemywin = SKLabelNode()
       var playerwin = SKLabelNode()
    var backbut = SKLabelNode()
    
  

                         
  
 
    
    override func didMove(to view: SKView) {
   ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
       player = self.childNode(withName: "player") as! SKSpriteNode
        toplabel = self.childNode(withName: "TopLabel") as! SKLabelNode
          bottomlabel = self.childNode(withName: "BottomLabel") as! SKLabelNode
        ball.physicsBody?.applyImpulse(CGVector (dx: 20, dy: 20))
        enemywin = self.childNode(withName: "enemywin") as! SKLabelNode
         playerwin = self.childNode(withName: "playerwin") as! SKLabelNode
        backbut = self.childNode(withName: "backbut") as! SKLabelNode
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.restitution = 0.8
        border.friction = 0
        self.physicsBody = border
        enemywin.isHidden = true
        playerwin.isHidden = true
        
    }
   
    func startgame(){
      
        toplabel.text = "\(scoreenemy)"
        bottomlabel.text = "\(scoreplayer)"
        
    }
    func addscore(PlayerWhoWon:SKSpriteNode){
    if PlayerWhoWon == player{
    scoreplayer += 1
        ball.position = CGPoint(x: 0, y: 0 )
        ball.physicsBody?.velocity = CGVector (dx: 0, dy: 0)
     ball.physicsBody?.applyImpulse(CGVector (dx: -20, dy: -20))
    }
    else if PlayerWhoWon == enemy{
         ball.position = CGPoint(x: 0, y:0 )
         ball.physicsBody?.velocity = CGVector (dx: 0, dy: 0)
         ball.physicsBody?.applyImpulse(CGVector (dx: 20, dy: 20))
    scoreenemy += 1
  
        
    }
        enemywin.isHidden = true
        playerwin.isHidden = true
        if scoreplayer == 7 {
            playerwin.isHidden = false
            
            
            
        }
         if scoreenemy == 7 {
            enemywin.isHidden = false
        }
        toplabel.text = "\(scoreenemy)"
        bottomlabel.text = "\(scoreplayer)"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self)
            
            player.run(SKAction.moveTo(x: location.x, duration: 0.2))
            
        }
        }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
   
    override func update(_ currentTime: TimeInterval) {
        
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.5))
        if ball.position.y >= enemy.position.y - 75{
            
            enemy.run(SKAction.moveTo(x: ball.position.x + 10, duration: 0.2))
        }
        if ball.position.y <= player.position.y - 70{
            addscore(PlayerWhoWon: enemy)
            
        }
        else if ball.position.y >= enemy.position.y + 70{
            addscore(PlayerWhoWon: player)
            
        }
    }
}

