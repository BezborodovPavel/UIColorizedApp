//
//  ColorLabel.swift
//  UIColorizedApp
//
//  Created by Павел on 04.07.2022.
//

import SwiftUI

struct ColorLabel: View {
    let colorValue: Int
    var body: some View {
        Text(String(colorValue))
            .frame(width: 50)
    }
}
