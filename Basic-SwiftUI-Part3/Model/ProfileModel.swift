//
//  ProfileModel.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 17/03/22.
//

import Foundation

struct Profile:Codable{
    var name:String
    init() {
        self.name = ""
    }
    
    init(named name:String){
        self.name = name
    }
}
