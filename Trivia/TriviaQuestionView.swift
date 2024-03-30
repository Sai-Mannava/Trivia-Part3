//
//  TriviaQuestionView.swift
//  Trivia
//
//  Created by Sai Mannava on 3/29/24.
//

import SwiftUI

struct TriviaQuestionView: View {
    @ObservedObject var viewModel: TriviaViewModel
    
    var body: some View {
        List(viewModel.questions) { question in
            VStack(alignment: .leading) {
                Text(question.question)
                    .fontWeight(.bold)
                ForEach(question.allAnswers, id: \.self) { answer in
                    Text(answer)
                        .padding()
                }
            }
        }
        .navigationBarTitle("Trivia Questions", displayMode: .inline)
    }
}


