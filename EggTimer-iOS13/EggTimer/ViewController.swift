//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    private enum HardnessTime: Int {
        case softTime = 3
        case mediumTime = 6
        case hardTime = 15
    }
    private var timer: Timer?
    private var secondsRemaining = 0
    private var progressBarPace: Float = 0
    private var player: AVAudioPlayer!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }

        titleLabel.text = "\(buttonTitle)"
        stopTimer()
        progressBar.progress = 0

        if buttonTitle == "Hard" {
            secondsRemaining = HardnessTime.hardTime.rawValue
            progressBarPace = Float(HardnessTime.hardTime.rawValue)
        } else if buttonTitle == "Medium" {
            secondsRemaining = HardnessTime.mediumTime.rawValue
            progressBarPace = Float(HardnessTime.mediumTime.rawValue)
        } else {
            secondsRemaining = HardnessTime.softTime.rawValue
            progressBarPace = Float(HardnessTime.softTime.rawValue)
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
            progressBar.progress += 1/progressBarPace
        } else {
            stopTimer()
            playAlarm()
            titleLabel.text = "Done!"
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func playAlarm() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else {
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else {
                return
            }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
