//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allquestion = QuestionBank()
    var numQuestions : Int = 0
    var randomIndex : Int  = 0
    var playerAnswer : Bool = true
    var checkPosArray = [Int]()
    var score : Int = 0
    var currentQuestionNumber : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var progressWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numQuestions = allquestion.list.count
        randomIndex = randomIndexGenerator(0, numQuestions-1)
        //Generate random question
        let question = allquestion.list[randomIndex]
        questionLabel.text = question.questionText
        
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        checkPosArray.append(randomIndex)
        currentQuestionNumber += 1
        
        if sender.tag == 1 {
            playerAnswer = true
        }
        else {
            playerAnswer = false
        }
        
        checkAnswer()
        
        updateUI()
        
        nextQuestion()
    }
    
    func randomIndexGenerator(_ min: Int, _ max: Int) -> Int {
       return Int.random(in: min...max)
    }
    
    func updateUI() {
      scoreLabel.text = "\(score)"
      progressLabel.text = "\(currentQuestionNumber)/\(numQuestions)"
      progressBar.frame.size.width = (view.frame.size.width / CGFloat(numQuestions)) * CGFloat(currentQuestionNumber)
    }
    
    func nextQuestion() {
        if checkPosArray.count == numQuestions {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            //reset new game
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        } else {
        
        randomIndex = randomIndexGenerator(0, numQuestions - 1)
        while (checkPosArray.contains(randomIndex)){
            randomIndex = randomIndexGenerator(0, numQuestions - 1)
            }
        questionLabel.text = allquestion.list[randomIndex].questionText
            
        }
    }
    
    
    func checkAnswer() {
        if playerAnswer == allquestion.list[randomIndex].answer{
            score += 1
        }
    }
    
    
    func startOver() {
       checkPosArray = []
       score = 0
       currentQuestionNumber = 0
       updateUI()
       nextQuestion()
    }
    
}
