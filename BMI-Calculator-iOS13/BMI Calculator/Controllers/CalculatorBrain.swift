//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Lefteris Kostakis on 17/6/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {

    private var bmi: BMI?

    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)

        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor(red: 124/255,
                                                                         green: 17/255,
                                                                         blue: 255/255,
                                                                         alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor(red: 18/255,
                                                                                  green: 211/255,
                                                                                  blue: 77/255,
                                                                                  alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor(red: 190/255,
                                                                                green: 0,
                                                                                blue: 68/255,
                                                                                alpha: 1))
        }
    }

    func getBMIValue() -> String {
        String(format: "%.1f", bmi?.value ?? 0)

    }

    func getAdvice() -> String {
        bmi?.advice ?? "No advice"
    }

    func getColor() -> UIColor {
        bmi?.color ?? UIColor.white
    }
}
