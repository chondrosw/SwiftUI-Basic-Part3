//
//  View.swift
//  Basic-SwiftUI-Part3
//
//  Created by Chondro Satrio Wibowo on 17/03/22.
//

import SwiftUI

extension View{
    func bordered()-> some View{
        ModifiedContent(
        content: self, modifier: BorderedViewModifier()
        )
    }
}
