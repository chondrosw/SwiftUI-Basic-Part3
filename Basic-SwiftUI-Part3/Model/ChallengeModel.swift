//
//  ChallengeModel.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 18/03/22.
//

import Foundation

struct Challenge{
    let question:String
    let pronuncuation:String
    let answer:String
    var completed:Bool = false
    var succeeded:Bool = false
}
extension Challenge:Hashable{
    func hash(into hasher: inout Hasher) {
        question.hash(into: &hasher)
    }
}

struct ChallengeTest{
    let challenge:Challenge
    let answers:[String]
    func isAnswerCorrect(_ answer:String)-> Bool{
        return challenge.answer == answer
    }
}
