//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by mk1 on 26/05/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: Bool
    
    init(q: String, a: Bool){
        text = q
        answer = a
    }
}
