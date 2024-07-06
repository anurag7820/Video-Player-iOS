//
//  Constants.swift
//  Video_Player_Assignment
//
//  Created by anurag.sah on 04/07/24.
//

import Foundation

var jsonParagraph:  Paragraph = .init(
    
    sentences: [
        
         Sentence(
          text: "Hey there.",
          start: 0.24,
          end: 0.64)
        ,
        Sentence(
          text: "Hello.",
          start: 0.64,
          end: 1.12
        ),
        Sentence(
          text: "This is just an example to show you how the app works.",
          start: 1.12,
          end: 4.02
        ),
        Sentence(
          text: "You can see that I mean, it's highlighting the word that I'm speaking.",
          start: 4.64,
          end: 8.18
        ),
        Sentence(
          text: "This is just an example.",
          start: 8.355,
          end: 9.735
        ),
        Sentence(
          text: "There are so many other features in the app.",
          start: 9.795,
          end: 12.054999
        ),
        Sentence(
          text: "Looking for your feedback.",
          start: 12.115,
          end: 13.334999
        ),
        Sentence(
          text: "Thank you.",
          start: 14.035,
          end: 14.855
        )
    ],
    numWords: 33,
    start: 0.24,
    end: 9.735
)

var jsonWords: [Word] = [
    Word(word: "hey", start: 0.24, end: 0.39999998, confidence: 0.97580075, punctuated_word: "Hey"),
    Word(word: "there", start: 0.39999998, end: 0.64, confidence: 0.90846956, punctuated_word: "there."),
    Word(word: "hello", start: 0.64, end: 1.12, confidence: 0.99915236, punctuated_word: "Hello."),
    Word(word: "this", start: 1.12, end: 1.36, confidence: 0.99961674, punctuated_word: "This"),
    Word(word: "is", start: 1.36, end: 1.52, confidence: 0.9999211, punctuated_word: "is"),
    Word(word: "just", start: 1.52, end: 1.68, confidence: 0.99980634, punctuated_word: "just"),
    Word(word: "an", start: 1.68, end: 1.8399999, confidence: 0.9999027, punctuated_word: "an"),
    Word(word: "example", start: 1.8399999, end: 2.32, confidence: 0.99989533, punctuated_word: "example"),
    Word(word: "to", start: 2.32, end: 2.48, confidence: 0.9986327, punctuated_word: "to"),
    Word(word: "show", start: 2.48, end: 2.6399999, confidence: 0.99972266, punctuated_word: "show"),
    Word(word: "you", start: 2.6399999, end: 2.8799999, confidence: 0.9997788, punctuated_word: "you"),
    Word(word: "how", start: 2.8799999, end: 3.12, confidence: 0.9999062, punctuated_word: "how"),
    Word(word: "the", start: 3.12, end: 3.28, confidence: 0.9998802, punctuated_word: "the"),
    Word(word: "app", start: 3.28, end: 3.52, confidence: 0.9998466, punctuated_word: "app"),
    Word(word: "works", start: 3.52, end: 4.02, confidence: 0.9959134, punctuated_word: "works."),
    Word(word: "you", start: 4.64, end: 4.7999997, confidence: 0.98985183, punctuated_word: "You"),
    Word(word: "can", start: 4.7999997, end: 4.96, confidence: 0.9999521, punctuated_word: "can"),
    Word(word: "see", start: 4.96, end: 5.12, confidence: 0.9996784, punctuated_word: "see"),
    Word(word: "that", start: 5.12, end: 5.44, confidence: 0.99995375, punctuated_word: "that"),
    Word(word: "i", start: 5.52, end: 5.6, confidence: 0.9989512, punctuated_word: "I"),
    Word(word: "mean", start: 5.6, end: 5.92, confidence: 0.9801569, punctuated_word: "mean,"),
    Word(word: "it's", start: 5.92, end: 6.42, confidence: 0.9990597, punctuated_word: "it's"),
    Word(word: "highlighting", start: 6.48, end: 6.96, confidence: 0.99929535, punctuated_word: "highlighting"),
    Word(word: "the", start: 6.96, end: 7.04, confidence: 0.999892, punctuated_word: "the"),
    Word(word: "word", start: 7.04, end: 7.2799997, confidence: 0.9989009, punctuated_word: "word"),
    Word(word: "that", start: 7.2799997, end: 7.52, confidence: 0.9998938, punctuated_word: "that"),
    Word(word: "i'm", start: 7.52, end: 7.68, confidence: 0.9968726, punctuated_word: "I'm"),
    Word(word: "speaking", start: 7.68, end: 8.18, confidence: 0.9949625, punctuated_word: "speaking."),
    Word(word: "this", start: 8.355, end: 8.594999, confidence: 0.99977845, punctuated_word: "This"),
    Word(word: "is", start: 8.594999, end: 8.754999, confidence: 0.99983037, punctuated_word: "is"),
    Word(word: "just", start: 8.754999, end: 8.995, confidence: 0.9998349, punctuated_word: "just"),
    Word(word: "an", start: 8.995, end: 9.235, confidence: 0.999801, punctuated_word: "an"),
    Word(word: "example", start: 9.235, end: 9.735, confidence: 0.96656156, punctuated_word: "example."),
    Word(word: "there", start: 9.795, end: 10.035, confidence: 0.99970967, punctuated_word: "There"),
    Word(word: "are", start: 10.035, end: 10.195, confidence: 0.9997596, punctuated_word: "are"),
    Word(word: "so", start: 10.195, end: 10.355, confidence: 0.999137, punctuated_word: "so"),
    Word(word: "many", start: 10.355, end: 10.674999, confidence: 0.99993145, punctuated_word: "many"),
    Word(word: "other", start: 10.674999, end: 10.914999, confidence: 0.9995104, punctuated_word: "other"),
    Word(word: "features", start: 10.914999, end: 11.235, confidence: 0.99990857, punctuated_word: "features"),
    Word(word: "in", start: 11.235, end: 11.3949995, confidence: 0.9997899, punctuated_word: "in"),
    Word(word: "the", start: 11.3949995, end: 11.554999, confidence: 0.99984336, punctuated_word: "the"),
    Word(word: "app", start: 11.554999, end: 12.054999, confidence: 0.99841607, punctuated_word: "app."),
    Word(word: "looking", start: 12.115, end: 12.434999, confidence: 0.99844956, punctuated_word: "Looking"),
    Word(word: "for", start: 12.434999, end: 12.594999, confidence: 0.9731882, punctuated_word: "for"),
    Word(word: "your", start: 12.594999, end: 12.834999, confidence: 0.99910563, punctuated_word: "your"),
    Word(word: "feedback", start: 12.834999, end: 13.334999, confidence: 0.7773267, punctuated_word: "feedback."),
    Word(word: "thank", start: 14.035, end: 14.355, confidence: 0.9968364, punctuated_word: "Thank"),
    Word(word: "you", start: 14.355, end: 14.855, confidence: 0.9981744, punctuated_word: "you.")
]

enum Constants {
    case screenTitle
    case hideCaptainTitle
    case showCaptainTitle
    
    var val: String {
        switch self {
        case .screenTitle:
            return "Video Player"
            
        case .hideCaptainTitle:
            return "Hide Caption"
            
        case .showCaptainTitle:
            return "Show Caption"
        }
    }
}

