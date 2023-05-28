//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    private enum HardnessTime: Int {
        case softTime = 3
        case mediumTime = 420
        case hardTime = 720
    }
    private var timer: Timer?
    private var secondsRemaining = 0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }

        titleLabel.text = "How do you like your eggs?"
        stopTimer()

        if buttonTitle == "Hard" {
            secondsRemaining = HardnessTime.hardTime.rawValue
        } else if buttonTitle == "Medium" {
            secondsRemaining = HardnessTime.mediumTime.rawValue
        } else {
            secondsRemaining = HardnessTime.softTime.rawValue
        }

        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(updateTimer),
                                     userInfo: nil,
                                     repeats: true)
    }

    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        } else {
            stopTimer()
            titleLabel.text = "Done!"
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
