//
//  ExtractedView.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 17/03/22.
//

import SwiftUI

struct WelcomeMessageView: View {
    var body: some View {
        Label{
            VStack(alignment:.leading){
                Text("Welcome to")
                    .font(.headline)
                    .bold()
                Text("Kuchi")
                    .font(.largeTitle)
                    .bold()
            }.foregroundColor(.red)
                .lineLimit(1)
                .padding(.horizontal)
        }icon:{
            LogoImage()
        }.labelStyle(HorizontallyAlignedLabelStyle())
    }
}

struct ExtractedView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeMessageView()
    }
}
