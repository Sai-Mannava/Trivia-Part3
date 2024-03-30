import SwiftUI
struct TriviaResponse: Codable {
    let response_code: Int
    let results: [TriviaQuestion]
}

struct TriviaQuestion: Codable, Identifiable {
    var id: UUID { UUID() }
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    var allAnswers: [String] {
        (incorrectAnswers + [correctAnswer]).shuffled()
    }
    
    enum CodingKeys: String, CodingKey {
        case type, difficulty, category, question, correctAnswer = "correct_answer", incorrectAnswers = "incorrect_answers"
    }
    
}
extension String {
    func decodingHTMLEntities() -> String {
        guard let data = self.data(using: .utf8) else { return self }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue]
        let decodedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil).string
        return decodedString ?? self
    }
}

