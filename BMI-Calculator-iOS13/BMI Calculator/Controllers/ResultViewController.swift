//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Lefteris Kostakis on 17/6/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    var bmiValue: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
    }

    @IBAction func recalculateTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
