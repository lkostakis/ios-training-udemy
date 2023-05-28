//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!

    private var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonTapped(_ sender: UIButton) {

        guard let userAnswer = sender.currentTitle else {
            return
        }
        let userIsRight = quizBrain.checkAnswer(answer: userAnswer)

        if userIsRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }

        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2,
                                     target: self,
                                     selector: #selector(updateUI),
                                     userInfo: nil,
                                     repeats: false)
    }

    @objc private func updateUI() {
        let possibleAnswers = quizBrain.getPossibleAnswers()
        firstAnswerButton.setTitle(possibleAnswers[0], for: .normal)
        secondAnswerButton.setTitle(possibleAnswers[1], for: .normal)
        thirdAnswerButton.setTitle(possibleAnswers[2], for: .normal)
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        firstAnswerButton.backgroundColor = .clear
        secondAnswerButton.backgroundColor = .clear
        thirdAnswerButton.backgroundColor = .clear
    }
}

