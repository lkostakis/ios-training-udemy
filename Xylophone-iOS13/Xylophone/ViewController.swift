//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            return
        }

        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }

        playSound(with: buttonTitle)
    }

    func playSound(with resource: String) {

        guard let url = Bundle.main.url(forResource: resource, withExtension: "wav") else {
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
