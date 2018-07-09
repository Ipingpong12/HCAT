//
//  LabyViewController.swift
//  FinnaSphere
//
//  Created by Matias Ortiz on 5/9/18.
//  Copyright © 2018 Matias Ortiz. All rights reserved.
//
import Foundation
import UIKit
import SpriteKit
import GameplayKit
import CoreMotion

class LabyViewController: UIViewController {
    
    
//      var manager = CMMotionManager ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameSceneLaby") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

//    override func viewDidAppear(_ animated: Bool) {
//        manager.accelerometerUpdateInterval = 0.1
//        manager.startAccelerometerUpdates(to: OperationQueue.current!) {  (data, error) in
//            if let myData = data{
//                print(myData)
//
//            }
//            }
//        }
    }


