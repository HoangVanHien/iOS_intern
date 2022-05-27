//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by mk1 on 27/05/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bmiValue: String?
    var bmiAdvice: String?
    var bmiColor: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmiValue
        adviceLabel.text = bmiAdvice
        view.backgroundColor = bmiColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onRecalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
