//
//  responseModel.swift
//  Video_Player_Assignment
//
//  Created by anurag.sah on 04/07/24.
//

import Foundation
import Foundation

// MARK: - Response
struct Response: Codable {
    let metadata: Metadata
    let results: Results
}

// MARK: - Metadata
struct Metadata: Codable {
    let transactionKey: String
    let requestID: String
    let sha256: String
    let created: String
    let duration: Double
    let channels: Int
    let models: [String]
    let modelInfo: ModelInfo
    
    enum CodingKeys: String, CodingKey {
        case transactionKey = "transaction_key"
        case requestID = "request_id"
        case sha256
        case created
        case duration
        case channels
        case models
        case modelInfo = "model_info"
    }
}

// MARK: - ModelInfo
struct ModelInfo: Codable {
    let model: Model
    
    enum CodingKeys: String, CodingKey {
        case model = "30089e05-99d1-4376-b32e-c263170674af"
    }
}

// MARK: - Model
struct Model: Codable {
    let name: String
    let version: String
    let arch: String
}

// MARK: - Results
struct Results: Codable {
    let channels: [Channel]
}

// MARK: - Channel
struct Channel: Codable {
    let alternatives: [Alternative]
}

// MARK: - Alternative
struct Alternative: Codable {
    let transcript: String
    let confidence: Double
    let words: [Word]
    let paragraphs: Paragraphs
}

// MARK: - Paragraphs
struct Paragraphs: Codable {
    let transcript: String
    let paragraphs: [Paragraph]
}

// MARK: - Paragraph
struct Paragraph: Codable {
    var sentences: [Sentence]
    let numWords: Int
    let start: Double
    let end: Double
    
    enum CodingKeys: String, CodingKey {
        case sentences
        case numWords = "num_words"
        case start
        case end
    }
}

// MARK: - Sentence
struct Sentence: Codable, Equatable {
    let text: String
    let start: Double
    let end: Double
}

// MARK: - Word
struct Word: Codable, Equatable {
    let word: String
    let start: Double
    let end: Double
    let confidence: Double
    let punctuated_word: String
    
    enum CodingKeys: String, CodingKey {
        case word
        case start
        case end
        case confidence
        case punctuated_word = "punctuated_word"
    }
}
