//
//  HorizontallyAlignedLabelStyle.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 17/03/22.
//

import SwiftUI

struct HorizontallyAlignedLabelStyle:LabelStyle{
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.icon
            configuration.title
        }
    }
}
