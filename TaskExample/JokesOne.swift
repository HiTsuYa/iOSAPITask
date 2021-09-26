// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let jokesOne = try? newJSONDecoder().decode(JokesOne.self, from: jsonData)

import Foundation

// MARK: - JokesOne
struct JokesOne: Codable {
    let success: Success
    let contents: Contents
}

// MARK: - Contents
struct Contents: Codable {
    let jokes: [JokeElement]
    let copyright: String
}

// MARK: - JokeElement
struct JokeElement: Codable {
    let jokeDescription, language, background, category: String
    let date: String
    let joke: JokeJoke

    enum CodingKeys: String, CodingKey {
        case jokeDescription = "description"
        case language, background, category, date, joke
    }
}

// MARK: - JokeJoke
struct JokeJoke: Codable {
    let title, lang, length, clean: String
    let racial, date, id, text: String
}

// MARK: - Success
struct Success: Codable {
    let total: Int
}
