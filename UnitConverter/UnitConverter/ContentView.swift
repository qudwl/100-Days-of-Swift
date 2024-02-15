//
//  ContentView.swift
//  UnitConverter
//
//  Created by Byeongji Lim on 2/15/24.
//

import SwiftUI

struct ContentView: View {
    let tempUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    @State private var fromUnit = "Celsius"
    @State private var toUnit = "Celsius"
    @State private var inputNum: Double = 0.0
    
    @FocusState private var inputFocused: Bool
    
    var result: Double {
        switch fromUnit {
        case "Celsius":
            switch toUnit {
            case "Celsius":
                return inputNum
            case "Fahrenheit":
                return inputNum * 9 / 5 + 32
            case "Kelvin":
                return inputNum + 273.15
            default:
                return -1
            }
        case "Fahrenheit":
            switch toUnit {
            case "Celsius":
                return (inputNum - 32) * 5 / 9
            case "Fahrenheit":
                return inputNum
            case "Kelvin":
                return (inputNum - 32) * 5 / 9 + 273.15
            default:
                return -1
            }
        case "Kelvin":
            switch toUnit {
            case "Celsius":
                return inputNum - 273.15
            case "Fahrenheit":
                return (inputNum - 273.15) * 9 / 5 + 32
            case "Kelvin":
                return inputNum
            default:
                return -1
            }
        default:
            return -1
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Unit Selection") {
                    HStack{
                        Picker("From", selection: $fromUnit) {
                            ForEach(tempUnits, id:\.self) {
                                Text("\($0)")
                            }
                        }
                        Picker("To", selection: $toUnit) {
                            ForEach(tempUnits, id:\.self) {
                                Text("\($0)")
                            }
                        }
                    }
                }
                Section("Input") {
                    TextField("Input Number", value: $inputNum, format: .number)
                        .focused($inputFocused)
                        .keyboardType(.decimalPad)
                }
                Section("Output") {
                    Text(result, format: .number)
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
