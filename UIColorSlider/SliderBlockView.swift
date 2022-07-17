//
//  SliderBlockView.swift
//  UIColorSlider
//
//  Created by Kislov Vadim on 17.07.2022.
//

import SwiftUI

struct SliderBlockView: View {
    @Binding var colorValue: Double

    @State private var colorValueTF = ""
    @State private var isAlertShowed = false

    let sliderColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Text(getRoundedColorValue())
                .frame(width: 35, alignment: .leading)
            
            Slider(value: $colorValue, in: 0...255)
                .tint(sliderColor)
                .onChange(of: colorValue) {
                    colorValueTF = String(lround($0))
                }
            
            TextField("", text: $colorValueTF) { _ in
                checkColorValue()
            }
                .frame(width: 50)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .alert("Error", isPresented: $isAlertShowed, actions: { }) {
                    Text("Enter a number from 0 to 255")
                }
        }
    }
    
    init(colorValue: Binding<Double>, sliderColor: Color) {
        self._colorValue = colorValue
        self.sliderColor = sliderColor
        
        _colorValueTF = State(initialValue: getRoundedColorValue())
    }
}

extension SliderBlockView {
    private func checkColorValue() {
        if let value = Double(colorValueTF), (0...255).contains(Double(value)) {
            colorValue = value
            return
        }
        
        colorValue = 0
        colorValueTF = "0"
        
        isAlertShowed.toggle()
    }
    
    private func getRoundedColorValue() -> String {
        String(lround($colorValue.wrappedValue))
    }
}

struct SliderBlockView_Previews: PreviewProvider {
    static var previews: some View {
        SliderBlockView(colorValue: .constant(255), sliderColor: .red)
    }
}
