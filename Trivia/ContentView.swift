import SwiftUI
import Foundation
struct ContentView: View {
    @State private var triviaOptions = TriviaOptions()
    @StateObject var viewModel = TriviaViewModel()
    @State private var showQuestions = false
    
    var body: some View {
        NavigationView {
            VStack {
                OptionsView(triviaOptions: $triviaOptions)
                
                Button("Start Game") {
                    viewModel.fetchTriviaQuestions()
                    
                }
                .navigationTitle("Trivia Options")
                .sheet(isPresented: $showQuestions) {
                    // Present the questions in a new sheet or navigate to it
                    TriviaQuestionView(viewModel: viewModel)
                }
            }
        }
    }
}
