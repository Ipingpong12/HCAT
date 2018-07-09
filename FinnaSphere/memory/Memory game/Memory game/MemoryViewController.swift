//
//  ViewController.swift
//  Memory game
//
//  Created by Matias Ortiz on 5/8/18.
//  Copyright © 2018 Matias Ortiz. All rights reserved.
//

import Foundation
import UIKit

class MemoryViewController : UIViewController{
    
    var model = Memory()
    var cardArray = [card]()
    let cardone = card()
    override func viewDidLoad() {
        super.viewDidLoad()
        cardArray = model.getcards()
    }
}

