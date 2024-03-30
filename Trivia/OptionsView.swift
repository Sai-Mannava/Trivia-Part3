//
//  OptionsView.swift
//  Trivia
//
//  Created by Sai Mannava on 3/29/24.
//

import SwiftUI

struct OptionsView: View {
    @Binding var triviaOptions: TriviaOptions
    
    var body: some View {
        Form {
            Section(header: Text("Number of Questions")) {
                Stepper("\(triviaOptions.amount) Questions", value: $triviaOptions.amount, in: 1...50)
            }
            
            Section(header: Text("Category")) {
                // Example of expanding categories in the Picker
                Picker("Select Category", selection: $triviaOptions.category) {
                    Text("General Knowledge").tag(9)
                    Text("Mythology").tag(20)
                    Text("Sports").tag(21)
                    Text("Geography").tag(22)
                    // Add other categories as needed
                }

            }
            
            Section(header: Text("Difficulty")) {
                Picker("Select Difficulty", selection: $triviaOptions.difficulty) {
                    Text("Easy").tag("easy")
                    Text("Medium").tag("medium")
                    Text("Hard").tag("hard")
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Type of Questions")) {
                Picker("Select Type", selection: $triviaOptions.type) {
                    Text("Multiple Choice").tag("multiple")
                    Text("True/False").tag("boolean")
                }.pickerStyle(SegmentedPickerStyle())
            }
        }
    }
}


