//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculator = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSliderChange(_ sender: UISlider) {
        switch sender{
        case heightSlider:
            heightLabel.text = String(format: "%.2fm", sender.value)
        case weightSlider:
            weightLabel.text = String(format: "%.0fKg", sender.value)
        default: break
        }
    }
    
    @IBAction func onCalculatePressed(_ sender: UIButton) {
        calculator.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    //prepare call before segue make transition
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculator.getBMIValue()
            destinationVC.bmiAdvice = calculator.getBMIAdvice()
            destinationVC.bmiColor = calculator.getBMIColor()
        }
    }
}

