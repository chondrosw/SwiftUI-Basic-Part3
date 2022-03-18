//
//  ChoicesView.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 18/03/22.
//

import SwiftUI

struct ChoicesView:View{
    let challengeTest:ChallengeTest
    @State var challengeSolved = false
    @State var isChallengeResultAlertDisplayed = false
    @ObservedObject var challengesViewModel = ChallengesViewModel()
    var body: some View{
        VStack(spacing:25){
            ForEach(0 ..< challengeTest.answers.count){index in
                Button(action: {
                    challengeSolved = checkAnswer(at: index)
                    isChallengeResultAlertDisplayed = true
                }, label: {
                    ChoicesRow(choice: challengeTest.answers[index])
                }).alert(isPresented: $isChallengeResultAlertDisplayed, content: {
                    challengeOutcomeAlert()
                })
                Divider()
            }
        }
    }
}

extension ChoicesView{
    func challengeOutcomeAlert()->Alert{
        let alert:Alert
        if challengeSolved{
            let dismissButton = Alert.Button.default(Text("OK")){
                isChallengeResultAlertDisplayed = false
                challengesViewModel.generateRandomChallenge()
            }
            alert = Alert(
            title: Text("Congratulations"),
            message: Text("The answer is correct"),
            dismissButton: dismissButton)
            return alert
        }else{
            let dismissButton = Alert.Button.default(Text("OK")) {
                    isChallengeResultAlertDisplayed = false
                  }
            alert = Alert(
                    title: Text("Oh no!"),
                    message: Text("Your answer is not correct!"),
                    dismissButton: dismissButton
                  )
            return alert
        }
        
    }
    func checkAnswer(at index:Int)->Bool{
        let answer = challengeTest.answers[index]
        let challengeSolved:Bool
        
        if challengeTest.isAnswerCorrect(answer){
            challengeSolved = true
            challengesViewModel.saveCorrectAnswer(for: challengeTest.challenge)
        }else{
            challengeSolved = false
            challengesViewModel.saveWrongAnswer(for: challengeTest.challenge)
        }
        isChallengeResultAlertDisplayed = true
        return challengeSolved
    }
}
