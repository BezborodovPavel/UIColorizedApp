//
//  ColorValueField.swift
//  UIColorizedApp
//
//  Created by Павел on 04.07.2022.
//

import SwiftUI

struct ColorValueField: View {
    @Binding var colorValue: Double
    @Binding var textValue: String
    @State var focusedView: Focused
    @State private var alertPresented = false
    
    var body: some View {
        TextField("", text: $textValue)
            .textFieldStyle(.roundedBorder)
            .alert("Пожалуйста введите число от 1 до 255", isPresented: $alertPresented, actions: {})
            .keyboardType(.numberPad)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Ok") {
                        validate(inputValue: textValue)
                    }
                }
            }
            .onAppear {
                textValue = String(Int(colorValue))
            }
            .frame(width: 50)
    }
}

extension ColorValueField {
    private func validate(inputValue: String) {
        guard let DoubleValue = Double(inputValue) else {return}
        if !(1...255).contains(DoubleValue) {
            colorValue = 0
            textValue = "0"
            alertPresented.toggle()
        } else {
            colorValue = DoubleValue
            focusedView.focused = false
        }
    }
}
