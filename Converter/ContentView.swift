//
//  ContentView.swift
//  Converter
//
//  Created by Nikolai Grachev on 18.01.2024.
//

import SwiftUI

struct ContentView: View {
    @State var inputTypeValue = "seconds"
    @State var outTypeValue = "seconds"
    @State var amount = ""
    @FocusState var amountIsFocused: Bool
    
    let values = ["seconds", "minutes", "hours", "days"]
    
    var result: String {
        var result = ""
        
        if inputTypeValue == "seconds" && outTypeValue == "seconds" {
            result = amount
        } else if inputTypeValue == "seconds" && outTypeValue == "minutes" {
            let total = (Double(amount) ?? 0.0 ) / 60.0
            result = String(format: "%.2f", total)

        } else if inputTypeValue == "seconds" && outTypeValue == "hours" {
            let total = (Double(amount) ?? 0.0) / 60 / 60
            result = String(total)
        } else if inputTypeValue == "seconds" && outTypeValue == "days" {
            let total = (Double(amount) ?? 0.0) / 60 / 60 / 24
            result = String(total)
        } else if inputTypeValue == "minutes" && outTypeValue == "seconds" {
            let total = (Double(amount) ?? 0.0) * 60
            result = String(format: "%.2f", total)
        } else if inputTypeValue == "minutes" && outTypeValue == "minutes" {
            result = amount
        } else if inputTypeValue == "minutes" && outTypeValue == "hours" {
            let total = (Double(amount) ?? 0.0) / 60
            result = String(format: "%.2f", total)
        } else if inputTypeValue == "minutes" && outTypeValue == "days" {
            let total = (Double(amount) ?? 0.0) / 1440
            result = String(format: "%.4f", total)
        } else if inputTypeValue == "hours" && outTypeValue == "seconds" {
            let total = (Double(amount) ?? 0.0) * 60 * 60
            result = String(format: "%.2f", total)
        } else if inputTypeValue == "hours" && outTypeValue == "minutes" {
            let total = (Double(amount) ?? 0.0) * 60
            result = String(format: "%.2f", total)
        } else if inputTypeValue == "hours" && outTypeValue == "hours" {
            result = amount
        } else if inputTypeValue == "hours" && outTypeValue == "days" {
            let total = (Double(amount) ?? 0.0) / 24
            result = String(format: "%.2f", total)
        } else if inputTypeValue == "days" && outTypeValue == "seconds" {
            let total = (Double(amount) ?? 0.0) * 24 * 60 * 60
            result = String(total)
        } else if inputTypeValue == "days" && outTypeValue == "minutes" {
            let total = (Double(amount) ?? 0.0) * 24 * 60
            result = String(total)
        } else if inputTypeValue == "days" && outTypeValue == "hours" {
            let total = (Double(amount) ?? 0.0) * 24
            result = String(total)
        } else if inputTypeValue == "days" && outTypeValue == "days" {
            result = amount
        }
        return result
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(text: $amount) {
                        Text("Enter your value")
                    }
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                }
                
                Section("Choose type of values") {
                    
                    Picker("Input value", selection: $inputTypeValue) {
                        ForEach(values, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Output value", selection: $outTypeValue) {
                        ForEach(values, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Result") {
                    Text("\(result) \(outTypeValue)")
                }
            }
            .navigationTitle("Converter")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


