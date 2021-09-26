// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let holidays = try? newJSONDecoder().decode(Holidays.self, from: jsonData)

import Foundation

// MARK: - Holidays
struct Holidays: Codable {
    let meta: Meta
    let response: Response
}

// MARK: - Meta
struct Meta: Codable {
    let code: Int
}

// MARK: - Response
struct Response: Codable {
    let holidays: [Holiday]
}

// MARK: - Holiday
struct Holiday: Codable {
    let name, holidayDescription: String
    let country: Country
    let date: DateClass
    let type: [TypeElement]
    let locations, states: Locations

    enum CodingKeys: String, CodingKey {
        case name
        case holidayDescription = "description"
        case country, date, type, locations, states
    }
}

// MARK: - Country
struct Country: Codable {
    let id: ID
    let name: Name
}

enum ID: String, Codable {
    case mn = "mn"
}

enum Name: String, Codable {
    case mongolia = "Mongolia"
}

// MARK: - DateClass
struct DateClass: Codable {
    let iso: String
    let datetime: Datetime
    let timezone: Timezone?
}

// MARK: - Datetime
struct Datetime: Codable {
    let year, month, day: Int
    let hour, minute, second: Int?
}

// MARK: - Timezone
struct Timezone: Codable {
    let offset, zoneabb: String
    let zoneoffset, zonedst, zonetotaloffset: Int
}

enum Locations: String, Codable {
    case all = "All"
}

enum TypeElement: String, Codable {
    case nationalHoliday = "National holiday"
    case observance = "Observance"
    case season = "Season"
}
