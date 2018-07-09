//
//  GameSceneLaby.swift
//  FinnaSphere
//
//  Created by Matias Ortiz on 5/9/18.
//  Copyright © 2018 Matias Ortiz. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreMotion

class GameSceneLaby: SKScene, SKPhysicsContactDelegate {
    
    var manager = CMMotionManager ()
    var finnawork = SKSpriteNode()
    var end = SKSpriteNode()
    var WonLabelLaby = SKLabelNode ()
    var LostLabelLaby = SKLabelNode ()
    var death = SKSpriteNode ()
    var destx : CGFloat = 0.0
     let newlocation = CGPoint(x: 452, y: 881)
    

    override func didMove(to view: SKView) {
     
        //WonLabelLaby.isHidden = true
        //LostLabelLaby.isHidden = true
        self.physicsWorld.contactDelegate = self
        
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            
            if error != nil {
                return
            }
            
            self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)!) * 10,dy: CGFloat((data?.acceleration.y)!) * 10 )
        }
        
        
//        finnawork = self.childNode(withName: "finnawork") as! SKSpriteNode
//        end = self.childNode(withName: "end") as! SKSpriteNode
       WonLabelLaby = self.childNode(withName: "WonLabelLaby") as! SKLabelNode
       LostLabelLaby = self.childNode(withName: "LostLabelLaby") as! SKLabelNode
        death = self.childNode(withName: "death") as! SKSpriteNode
        finnawork = self.childNode(withName: "finnawork") as! SKSpriteNode
        WonLabelLaby.isHidden = true
        LostLabelLaby.isHidden = true
        
        
        
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) { 
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        
        if bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2 || bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1 {
            WonLabelLaby.isHidden = false
           print("youwon")
        }
        if bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 3 || bodyA.categoryBitMask == 3 && bodyB.categoryBitMask == 1 {
            finnawork.position = CGPoint(x: 452, y:  881)
    
            
            
            
            
            print("youlost")
            LostLabelLaby.isHidden = false
            
            
           
           
        }

       
        
        }
        }
        
      

    



