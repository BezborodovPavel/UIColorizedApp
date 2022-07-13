//
//  Slider.swift
//  UIColorizedApp
//
//  Created by Павел on 05.07.2022.
//

import SwiftUI

struct SliderColor: View {
    @Binding var colorValue: Double
    @Binding var textValue: String
    
    let colorSlider: UIColor
    
    var body: some View {
        Slider(value: $colorValue, in: 1...255, step: 1)
            .tint(Color(uiColor: colorSlider))
            .onChange(of: colorValue) { newValue in
                textValue = String(Int(newValue))
            }
    }
}
