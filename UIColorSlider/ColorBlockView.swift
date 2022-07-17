//
//  ColorBlockView.swift
//  UIColorSlider
//
//  Created by Kislov Vadim on 17.07.2022.
//

import SwiftUI

struct ColorBlockView: View {
    @Binding var redValue: Double
    @Binding var greenValue: Double
    @Binding var blueValue: Double
    
    let cornerRadius: CGFloat = 12
    
    var body: some View {
        VStack {
            Text("Color palette")
                .font(.largeTitle)
                .foregroundColor(getColor())
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(height: 150)
                .foregroundColor(getColor())
                .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.gray, lineWidth: 5)
                )
        }
    }
}

extension ColorBlockView {
    private func getColor() -> Color {
        Color(
            red: convertColor(value: redValue),
            green: convertColor(value: greenValue),
            blue: convertColor(value: blueValue)
        )
    }
    
    private func convertColor(value: Double) -> Double {
        value / 255
    }
}

struct ColorBlockView_Previews: PreviewProvider {
    static var previews: some View {
        ColorBlockView(
            redValue: getColorValue(),
            greenValue: getColorValue(),
            blueValue: getColorValue()
        ).padding(16)
    }
    
    static func getColorValue() -> Binding<Double> {
        .constant(Double.random(in: 0...255))
    }
}
