//
//  viewModel.swift
//  Video_Player_Assignment
//
//  Created by anurag.sah on 04/07/24.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    
    struct Model {
        let title: String
        var path: String?
        var subtitle: String
        
        init(title: String, subtitle: String) {
            self.title = title
            self.subtitle = subtitle
            self.path = nil
        }
    }
    
    @Published var model: Model
    var paraCache: [Sentence] = []
    var wordCache: [Word] = []
    
    init(model: Model){
        self.model = model
        getPath()
    }
    
    private func getPath(){
        guard let path = Bundle.main.path(forResource: "Video", ofType: "mp4") else {
            print("path for video not found")
            return
        }
        model.path = path
    }
    
    func updateCaptain(currentTime: Double){
        
        if let currSentence = jsonParagraph.sentences.first(where: { currentTime > $0.end })  {
            var sub = model.subtitle
            if sub.count > 0 {
                sub.removeLast()
            }
            if currSentence.text == sub {
                if let ind = jsonParagraph.sentences.firstIndex(of: currSentence){
                    jsonParagraph.sentences.remove(at: ind)
                    paraCache.append(currSentence)
                }
                model.subtitle = ""
            }
        }
        
        if let currentWord = jsonWords.first(where: { currentTime >= $0.start && currentTime <= $0.end }) {
            if let ind = jsonWords.firstIndex(of: currentWord){
                jsonWords.remove(at: ind)
                wordCache.append(currentWord)
            }
            model.subtitle += currentWord.punctuated_word + " "
        }
    }
}
