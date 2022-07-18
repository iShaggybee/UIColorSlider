//
//  ColorBlockView.swift
//  UIColorSlider
//
//  Created by Kislov Vadim on 17.07.2022.
//

import SwiftUI

struct ColorBlockView: View {
    let redValue: Double
    let greenValue: Double
    let blueValue: Double

    var body: some View {
        VStack {
            Text("Color palette")
                .font(.largeTitle)
                .foregroundColor(getColor())
            
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 150)
                .foregroundColor(getColor())
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 5)
                )
        }
    }
}

extension ColorBlockView {
    private func getColor() -> Color {
        Color(
            red: redValue / 255,
            green: greenValue / 255,
            blue: blueValue / 255
        )
    }
}

struct ColorBlockView_Previews: PreviewProvider {
    static var previews: some View {
        ColorBlockView(
            redValue: Double.random(in: 0...255),
            greenValue: Double.random(in: 0...255),
            blueValue: Double.random(in: 0...255)
        ).padding(16)
    }
}
