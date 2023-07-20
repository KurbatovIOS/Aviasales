//
//  SearchResult.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import Foundation

struct SearchResult: Codable {
    var passengers_count: Int
    var origin: City
    var destination: City
    var results: [Result]
}

struct City: Codable {
    var iata: String
    var name: String
}

struct Result: Codable, Identifiable {
    var id: String
    var departure_date_time: String
    var arrival_date_time: String
    var price: Price
    var airline: String
    var available_tickets_count: Int
}

struct Price: Codable {
    var currency: String
    var value: Int
}
