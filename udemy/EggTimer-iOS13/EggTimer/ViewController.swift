//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes: [String? : Int] = ["Soft" : 3, "Medium" : 5, "Hard" : 7]
    var totalSeconds: Int = 0
    var passedSeconds: Int = 0
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        print(sender.currentTitle ?? "")
        
        totalSeconds = eggTimes[sender.currentTitle] ?? 10
        passedSeconds = 1
        progressBar.progress = 0
        titleLabel.text = sender.currentTitle ?? "unknown"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    

    @objc func updateTimer(){
        progressBar.progress = Float(passedSeconds) / Float(totalSeconds)
        if passedSeconds < totalSeconds{
            passedSeconds += 1
        }
        else{
            timer.invalidate()
            titleLabel.text="Done!"
        }
    }
}
