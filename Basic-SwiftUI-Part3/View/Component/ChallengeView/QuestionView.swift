//
//  QuestionView.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 18/03/22.
//

import  SwiftUI

struct QuestionView:View{
    var question:String
    
    var body: some View{
        Text(question)
            .font(.system(size: 64))
            .allowsTightening(true)
            .foregroundColor(.red)
            .lineLimit(5)
            .multilineTextAlignment(.center)
    }
}
