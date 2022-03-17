//
//  WelcomeBackgroundImage.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 17/03/22.
//

import SwiftUI

struct WelcomeBackgroundImage: View {
    var body: some View {
        Image("swift_world").resizable().aspectRatio(1/1, contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .saturation(0.5)
            .blur(radius: 5)
            .opacity(0.08)
    }
}

struct WelcomeBackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBackgroundImage()
    }
}
