//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    private var tipPercentage: Int = 0
    private var totalBill: Double = 0
    private var splitNumber: Int = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardOnTap))
        view.addGestureRecognizer(tapGesture)
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        [zeroPctButton, tenPctButton, twentyPctButton].forEach { $0?.isSelected = false }
        sender.isSelected = true
        if let tipString = sender.currentTitle,
           let tipNumber = Int(String(tipString.dropLast())) {
            tipPercentage = tipNumber
        }
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = Int(sender.value)
        splitNumberLabel.text = String(splitNumber)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalCost = totalBill * (1 + Double(tipPercentage)/100) / Double(splitNumber)

        let resultsVC = ResultsViewController()
        resultsVC.totalCost = totalCost
        resultsVC.split = splitNumber
        resultsVC.tip = tipPercentage
        present(resultsVC, animated: true)
    }

    @IBAction func billTextFieldDidEndOnExit(_ sender: UITextField) {
        if let value = billTextField.text {
            totalBill = Double(value) ?? 0
        }
        view.becomeFirstResponder()
    }

    @objc func dismissKeyboardOnTap() {
        if let value = billTextField.text {
            totalBill = Double(value) ?? 0
        }
        billTextField.resignFirstResponder()
    }
}

