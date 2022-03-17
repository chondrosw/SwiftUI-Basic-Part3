//
//  EmptyView.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        ZStack{
            WelcomeBackgroundImage()
            WelcomeMessageView()
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
