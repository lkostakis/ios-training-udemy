//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Lefteris Kostakis on 17/6/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var totalCost = 0.0
    var split = 2
    var tip = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", totalCost)
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    }

    @IBAction func recalculateTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
