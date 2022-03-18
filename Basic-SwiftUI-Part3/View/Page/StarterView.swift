//
//  StarterView.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 18/03/22.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var userViewModel:UserManagerViewModel
    var body: some View {
        if userViewModel.isRegistered{
            WelcomeView()
        }else{
            RegisterView()
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
