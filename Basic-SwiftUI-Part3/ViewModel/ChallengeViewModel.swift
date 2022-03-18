//
//  ChallengeViewModel.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 18/03/22.
//

import Combine

class ChallengesViewModel:ObservableObject{
    static let challenges: [Challenge] = [
        Challenge(question: "はい", pronuncuation: "Hai", answer: "Yes"),
        Challenge(question: "いいえ", pronuncuation: "iie", answer: "No"),
        Challenge(question: "おねがい　します", pronuncuation: "Onegai shimasu", answer: "Please"),
        Challenge(question: "こんにちわ", pronuncuation: "Konnichiwa", answer: "Hello"),
        Challenge(question: "はじめまして", pronuncuation: "Hajimemashite", answer: "Nice to meet you"),
        Challenge(question: "もしもし", pronuncuation: "Moshi moshi", answer: "Hello"),
        Challenge(question: "すみません", pronuncuation: "Sumimasen", answer: "Excuse me"),
        Challenge(question: "ありがとう", pronuncuation: "Arigatō", answer: "Thank you"),
        Challenge(question: "ごめんなさい", pronuncuation: "Gomennasai", answer: "Sorry")
      ]
    
    var allAnswers:[String] {return Self.challenges.map{$0.answer}}
    var correctAnswers:[Challenge] = []
    var wrongAbswers:[Challenge] = []
    
    var numberOfAnswered:Int{return correctAnswers.count}
    @Published var currentChallenge:ChallengeTest?
    
    init() {
        generateRandomChallenge()
    }
    func getRandomAnswers(count:Int,including includingAnswer:String)->[String]{
        let answers = allAnswers
        
        guard count < answers.count else{
            return answers.shuffled()
        }
        
        var randomAnswers = Set<String>()
        randomAnswers.insert(includingAnswer)
        while randomAnswers.count < count{
            guard let randomAnswer = answers.randomElement() else{continue}
            randomAnswers.insert(randomAnswer)
        }
        return Array(randomAnswers).shuffled()
    }
    
    func generateRandomChallenge(){
        if correctAnswers.count < 5{
            currentChallenge = getRandomChallenge()
        }else{
            currentChallenge = nil
        }
    }
    
    func restart(){
        self.correctAnswers = []
        self.wrongAbswers = []
        generateRandomChallenge()
    }
    
    private func getRandomChallenge()-> ChallengeTest?{
        return getRandomChallenges(count: 1).first
    }
    
    private func getRandomChallenges(count:Int)->[ChallengeTest]{
        let challenges = Self.challenges.filter{$0.completed == false}
        var randomChallenges:Set<Challenge>
        
        if challenges.count < count{
            randomChallenges = Set(challenges)
        }else{
            randomChallenges = Set()
            while randomChallenges.count < count{
                guard let randomChallenge = challenges.randomElement() else{continue}
                randomChallenges.insert(randomChallenge)
            }
        }
        let tests = randomChallenges.map({ChallengeTest(challenge: $0, answers: getRandomAnswers(count: 3, including: $0.answer))})
        return tests.shuffled()
    }
    
    func saveCorrectAnswer(for challenge:Challenge){
        correctAnswers.append(challenge)
    }
    func saveWrongAnswer(for challenge:Challenge){
        wrongAbswers.append(challenge)
    }
}
