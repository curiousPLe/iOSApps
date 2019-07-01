//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var storyTextView: UILabel!
    
    let allQuestions = QuestionsBank()
    var currentIndex : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeButton(restartButton)
        restartButton.isHidden = true
        currentIndex = 1
        updateView(currentIndex)
        
    }
    
    func customizeButton(_ button : UIButton){
        button.backgroundColor = .clear
        button.setTitle("Restart", for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == 3 {
            restart()
        }
        else if sender.tag == 1 && currentIndex == 1 {
            currentIndex = 3
            updateView(currentIndex)
        }
        else if sender.tag == 1 && currentIndex == 3 {
            currentIndex = 6
            updateView(currentIndex)
        }
        else if sender.tag == 2 && currentIndex == 3 {
            currentIndex = 6
            updateView(currentIndex)
        }
        else if sender.tag == 2 && currentIndex == 1 {
            currentIndex = 2
            updateView(currentIndex)
        }
        else if sender.tag == 1 && currentIndex == 2 {
            currentIndex = 3
            updateView(currentIndex)
        }
        else if sender.tag == 1 && currentIndex == 3 {
            currentIndex = 6
            updateView(currentIndex)
        }
        else if sender.tag == 2 && currentIndex == 3 {
            currentIndex = 5
            updateView(currentIndex)
        }
        else if sender.tag == 2 && currentIndex == 2 {
            currentIndex = 4
            updateView(currentIndex)
        }
    }
    
    func updateView(_ index : Int) {
        if ( index == 4 || index == 5 || index == 6) {
            storyTextView.text = allQuestions.questionsBank[index-1].question
            topButton.isHidden = true
            bottomButton.isHidden = true
            restartButton.isHidden = false
        }
        
        else {
            storyTextView.text = allQuestions.questionsBank[index-1].question
            topButton.setTitle(allQuestions.questionsBank[index-1].answerA, for: .normal)
            bottomButton.setTitle(allQuestions.questionsBank[index-1].answerB, for: .normal)
            }

    }
    
    func restart() {
        currentIndex = 1
        topButton.isHidden = false
        bottomButton.isHidden = false
        restartButton.isHidden = true
        updateView(1)
    }
}

