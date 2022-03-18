//
//  ChallengeView.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 18/03/22.
//

import SwiftUI

struct ChallengeView:View{
    let challengeTest:ChallengeTest
    @State var showAnswers = false
    var body: some View{
        VStack{
            Button(action: {
                showAnswers.toggle()
            }, label: {
                QuestionView(question: challengeTest.challenge.question).frame(height:300)
            })
            if showAnswers{
                Divider()
                ChoicesView(challengeTest: challengeTest)
                    .frame(height:300)
                    .padding()
            }
        }
    }
}
