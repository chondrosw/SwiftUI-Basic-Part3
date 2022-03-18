//
//  HistoryModel.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 18/03/22.
//

import Foundation

struct History:Hashable{
    let date:Date
    let challenge:Challenge
    
    static func random()->History{
        let date = Date.init(timeIntervalSinceReferenceDate: -TimeInterval.random(in: 0...100000))
        let challenge = ChallengesViewModel.challenges.randomElement()
        
        return History(date: date, challenge: challenge!)
    }
    
    static func random(count:Int)->[History]{
        return (0 ..< count).map({_ in random()})
            .sorted(by: {$0.date < $1.date})
    }
}
