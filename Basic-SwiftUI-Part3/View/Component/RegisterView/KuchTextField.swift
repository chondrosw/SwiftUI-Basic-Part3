//
//  KuchTextField.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 17/03/22.
//

import SwiftUI

struct KuchTextStyle:TextFieldStyle{
    public func _body(configuration:TextField<Self._Label>)-> some View{
        return configuration.padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 26))
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 2).foregroundColor(.blue))
            .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 1, y: 2).padding()
    }
}
