//
//  Basic_SwiftUI_Part3App.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import SwiftUI

@main
struct Basic_SwiftUI_Part3App: App {
     let user = UserManagerViewModel()

    init() {
        user.load()
    }
    var body: some Scene {
        WindowGroup {
            StarterView().environmentObject(user)
               
        }
    }
}

struct Basic_SwiftUI_Part3App_Previews:PreviewProvider{
    static let user = UserManagerViewModel(name: "Chondro")
    static var previews: some View{
        RegisterView().environmentObject(user)
    }
}
