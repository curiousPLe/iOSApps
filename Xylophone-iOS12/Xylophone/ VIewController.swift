//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var player: AVAudioPlayer?
    var keyIndexArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // fill index array
        for i in 1...7 {
            keyIndexArray.append(i)
        }
       
    }



    @IBAction func notePressed(_ sender: UIButton) {
        var tagIndex:Int = sender.tag
        playSound(tagIndex)
    }
    
    func playSound(_ tagIndex: Int){
        let url = Bundle.main.url(forResource: "note\(tagIndex)", withExtension: "wav")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
            
        } catch let error {
            print(error)
        }

    }
    
  

}

