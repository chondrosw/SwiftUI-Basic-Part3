//
//  PracticeView.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 18/03/22.
//

import SwiftUI

struct PracticeView:View{
    @Binding var challengeTest:ChallengeTest?
    @Binding var userName:String
    
    @ViewBuilder
    var body: some View{
        if challengeTest != nil{
            ChallengeView(challengeTest: challengeTest!)
        }else{
            CongratulationsView(userName: userName)
        }
    }
}
