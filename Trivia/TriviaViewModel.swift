//
//  TriviaViewModel.swift
//  Trivia
//
//  Created by Sai Mannava on 3/29/24.
//

import SwiftUI

import Foundation

class TriviaViewModel: ObservableObject {
    @Published var questions: [TriviaQuestion] = []
    
    func fetchTriviaQuestions() {
        // Using the exact URL string provided
        let urlString = "https://opentdb.com/api.php?amount=10&category=9&difficulty=medium&type=multiple"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            // Check for error
            if let error = error {
                print("Data task error: \(error.localizedDescription)")
                return
            }
            
            // Ensure there is data
            guard let data = data else {
                print("No data in response")
                return
            }
            
            // Attempt to decode the data into TriviaResponse
            do {
                let decodedResponse = try JSONDecoder().decode(TriviaResponse.self, from: data)
                DispatchQueue.main.async {
                    // Assign the fetched questions to the published questions property
                    self?.questions = decodedResponse.results
                }
            } catch {
                print("JSON Decoding error: \(error)")
            }
        }.resume() // Start the network request
    }
}
