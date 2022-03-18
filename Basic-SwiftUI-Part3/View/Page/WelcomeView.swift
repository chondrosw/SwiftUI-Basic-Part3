//
//  WelcomeView.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 18/03/22.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var userManage:UserManagerViewModel
    @ObservedObject var challangesViewModel = ChallengesViewModel()
    @State var showPractice = false
    var body: some View {
        if showPractice{
            PracticeView(challengeTest: $challangesViewModel.currentChallenge, userName: $userManage.profile.name)
        }else{
            ZStack{
                WelcomeBackgroundImage()
                VStack{
                    Text(verbatim: "Hi, \(userManage.profile.name)")
                    WelcomeMessageView()
                    Button(action: {
                        showPractice = true
                    }, label: {
                        HStack{
                            Image(systemName: "play")
                            Text(verbatim: "Start")
                        }
                    })
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView().environmentObject(UserManagerViewModel())
    }
}
