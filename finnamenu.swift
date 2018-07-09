//
//  finnamenu.swift
//  FinnaSphere
//
//  Created by Matias Ortiz on 5/8/18.
//  Copyright © 2018 Matias Ortiz. All rights reserved.
//

import Foundation
import UIKit

enum gametype {
    case pong
    case laby
    case memory
}

class finnamenu : UIViewController{
    @IBAction func pong(_ sender: Any){
        movetogame(game: .pong)
        performSegue(withIdentifier: "gamereal", sender: self)
  
}
    @IBAction func laby(_ sender: Any){
         movetogame(game: .laby)
        performSegue(withIdentifier: "LabyViewController", sender: self)
        
    }
    @IBAction func memory(_ sender: Any){
        movetogame(game: .memory)
          performSegue(withIdentifier: "MemoryViewController", sender: self)
        
   
        
    }
    func movetogame(game: gametype){
        let finnamenu = self.storyboard? .instantiateViewController(withIdentifier: "Menu") as! GameViewController
        self.navigationController? .pushViewController(finnamenu, animated: true)
        
    }
}
