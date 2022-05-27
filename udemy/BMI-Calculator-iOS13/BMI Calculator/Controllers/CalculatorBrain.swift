//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by mk1 on 27/05/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.systemBlue)
        }
        else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.systemGreen)
        }
        else{
            bmi = BMI(value: bmiValue, advice: "Need more greens", color: UIColor.orange)
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0)
    }
    
    func getBMIAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getBMIColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
