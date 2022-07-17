//
//  ContentView.swift
//  UIColorSlider
//
//  Created by Kislov Vadim on 17.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack {
            ColorBlockView(
                redValue: $redValue,
                greenValue: $greenValue,
                blueValue: $blueValue
            )
            
            SliderBlockView(colorValue: $redValue, sliderColor: .red)
            SliderBlockView(colorValue: $greenValue, sliderColor: .green)
            SliderBlockView(colorValue: $blueValue, sliderColor: .blue)
            Spacer()
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
        .focused($isTextFieldFocused)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isTextFieldFocused.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
