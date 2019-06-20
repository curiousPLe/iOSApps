//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Dung Le on 6/16/19.
//  Copyright © 2019 Dung Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    @IBOutlet weak var ballImageView: UIImageView!
    
    var ballImageViewIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBall()
    }
    
    @IBAction func askButtonClicked(_ sender: UIButton) {
        updateBall()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateBall()
    }
    
    func updateBall () {
        ballImageViewIndex = Int.random(in: 0 ... 4)
        ballImageView.image = UIImage(named: ballArray[ballImageViewIndex])
    }
    
}

