//
//  ColorWindow.swift
//  UIColorizedApp
//
//  Created by Павел on 04.07.2022.
//

import SwiftUI

struct ColorRectangle: View {
    
    let color: UIColor
    var body: some View {
        Color(color)
            .frame(width: 200, height: 100, alignment: .topLeading)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: 4))
    }
}
