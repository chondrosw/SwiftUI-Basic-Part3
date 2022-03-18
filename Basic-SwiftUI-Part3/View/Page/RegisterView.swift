//
//  RegisterView.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 17/03/22.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var usermanager:UserManagerViewModel
    enum Field:Hashable{
        case name
    }
    @State var name:String = ""
    @FocusState var focusedField:Field?
    @FocusState var nameFieldFocused:Bool
    
    
    var body: some View {
            VStack{
                Spacer()
                WelcomeMessageView()
                TextField("Typer your name",text: $usermanager.profile.name).focused($nameFieldFocused).bordered().submitLabel(.done)
                HStack{
                    Spacer()
                    Text("\(usermanager.profile.name.count)")
                        .font(.caption)
                        .foregroundColor(self.usermanager.isUserNameValid() ? .green : .red)
                        .padding(.trailing)
                }.padding(.bottom)
                HStack{
                    Spacer()
                    Toggle(isOn:$usermanager.settings.rememberUser,label:{
                        Text("Remember me")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }).fixedSize()
                }.padding(.trailing)
                Button(action:registerUser, label: {
                    HStack{
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width:16,height:16,alignment:.center)
                        Text("OK")
                            .font(.body)
                            .bold()
                    }
                }).bordered().disabled(!usermanager.isUserNameValid())
                
                    
                Spacer()
            }.background(WelcomeBackgroundImage())
        
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static let user = UserManagerViewModel(name: "Chondro")
    static var previews: some View {
        RegisterView().environmentObject(user)
    }
}
extension RegisterView{
    func registerUser(){
        if usermanager.settings.rememberUser{
            usermanager.persistProfile()
        }else{
            usermanager.clear()
        }
        
        usermanager.persistSettings()
        usermanager.setRegistered()
    }
}
