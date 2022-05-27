//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTotalLabel: UITextField!
    @IBOutlet weak var tip0Button: UIButton!
    @IBOutlet weak var tip10Button: UIButton!
    @IBOutlet weak var tip20Button: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    
    var bill: Float?
    var tip: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //when tap on view where there is no other texture
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap)))
    }
    
    @objc private func onTap() {
        view.endEditing(true)
    }
    
    @IBAction func onTipSelected(_ sender: UIButton) {
        tip0Button.isSelected = false
        tip10Button.isSelected = false
        tip20Button.isSelected = false
        
        sender.isSelected = true
    }
    
    @IBAction func onSplitChanged(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0lf", splitStepper.value)
    }
    
    @IBAction func onCalculatePressed(_ sender: UIButton) {
        switch true{
        case tip0Button.isSelected:
            bill = Float(billTotalLabel.text ?? "0")! / Float(splitStepper.value)
            tip = 0
        case tip10Button.isSelected:
            bill = Float(billTotalLabel.text ?? "0")! * 1.1 / Float(splitStepper.value)
            tip = 10
        case tip20Button.isSelected:
            bill = Float(billTotalLabel.text ?? "0")! * 1.2 / Float(splitStepper.value)
            tip = 20
        default:
            bill = 0
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let desVC = segue.destination as! ResultViewController
            desVC.bill = bill
            desVC.people = Int(splitStepper.value)
            desVC.tip = tip
        }
    }
}

