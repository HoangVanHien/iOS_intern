//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diceImageView1.image = UIImage(named: "DiceFour")
        diceImageView2.alpha = 0.5
        
    }

    @IBOutlet weak var rollButton: UIButton!
    @IBAction func onRollButtonPressed(_ sender: UIButton) {
        let imageDiceArray: [UIImage?] = [
            UIImage(named: "DiceOne"),
            UIImage(named: "DiceTwo"),
            UIImage(named: "DiceThree"),
            UIImage(named: "DiceFour"),
            UIImage(named: "DiceFive"),
            UIImage(named: "DiceSix")]
        
        diceImageView1.image = imageDiceArray.randomElement() ?? nil
        diceImageView2.image = imageDiceArray.randomElement() ?? nil
        diceImageView1.alpha = CGFloat.random(in: 0...1)
        diceImageView2.alpha = CGFloat.random(in: 0...1)
    }
}

