//
//  SearchResult.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import Foundation

struct SearchResult: Codable {
    let passengersCount: Int
    let origin: City
    let destination: City
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case passengersCount = "passengers_count"
        case origin
        case destination
        case results
    }
}

struct City: Codable {
    let iata: String
    let name: String
}

struct Result: Codable, Identifiable {
    let id: String
    let departureDateTime: String
    let arrivalDateTime: String
    let price: Price
    let airline: String
    let availableTicketsCount: Int
    var isCheapest: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case departureDateTime = "departure_date_time"
        case arrivalDateTime = "arrival_date_time"
        case price
        case airline
        case availableTicketsCount = "available_tickets_count"
    }
}

struct Price: Codable {    
    let currency: String
    let value: Int
}
