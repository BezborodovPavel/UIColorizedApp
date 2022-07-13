//
//  ContentView.swift
//  UIColorizedApp
//
//  Created by Павел on 04.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State var redColor = Double.random(in: 1...255)
    @State var greenColor = Double.random(in: 1...255)
    @State var blueColor = Double.random(in: 1...255)
    
    var body: some View {
        
        VStack {
            ColorRectangle(color: UIColor(red: redColor / 255, green: greenColor / 255, blue: blueColor / 255, alpha: 0.5))
            lineOfSettings(color: $redColor, baseColor: .red)
            lineOfSettings(color: $greenColor, baseColor: .green)
            lineOfSettings(color: $blueColor, baseColor: .blue)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct lineOfSettings: View, Focused {
    
    @FocusState var focused
    @Binding var color: Double
    @State var textValueColor = ""
    let baseColor: UIColor
    
    var body: some View {
        HStack {
            ColorLabel(colorValue: Int(color))
                .foregroundColor(Color(uiColor: baseColor))
            SliderColor(colorValue: $color, textValue: $textValueColor, colorSlider: baseColor)
            ColorValueField(colorValue: $color, textValue: $textValueColor, focusedView: self)
                .foregroundColor(Color(uiColor: baseColor))
        }
        .padding()
        .focused($focused)
    }
}

extension ContentView {
    private func validate(inputValue: String, succes: () -> Void, fail: () -> Void) {
        guard let DoubleValue = Double(inputValue) else {return}
        if !(1...255).contains(DoubleValue) {
            succes()
        } else {
            fail()
        }
    }
}
