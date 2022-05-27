//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var tale: StoryBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(0)
    }


    @IBAction func onChoicePressed(_ sender: UIButton) {
        switch sender{
        case choice1Button:
            updateUI(1)
        case choice2Button:
            updateUI(2)
        default: break
            
        }
    }
    
    @objc func updateUI(_ choiceNumber : Int){
        tale.nextStory(choiceNumber)
        storyLabel.text = tale.getCurStoryTitle()
        choice1Button.setTitle(tale.getCurStoryChoice1(), for: .normal)
        choice2Button.setTitle(tale.getCurStoryChoice2(), for: .normal)
    }
}

