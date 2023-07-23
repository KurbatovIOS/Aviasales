//
//  FormatterService.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 21.07.2023.
//

import Foundation

protocol FormatterServiceProtocol {
    func formatTicketCountMessage(ticketCount: Int) -> String
    func formatFlightDate(date: String) -> String
    func formatTime(date: String) -> String
    func getMonth(date: String) -> String
}

class FormatterService: FormatterServiceProtocol {
    
    private let dateFormatter = DateFormatter()
    
    func formatTicketCountMessage(ticketCount: Int) -> String {
        var message = ""
        switch ticketCount {
        case 1:
            message = "билет"
        case 2...4:
            message = "билета"
        case 5...9:
            message = "билетов"
        default:
            message = "билетов"
        }
        return message
    }
    
    func formatFlightDate(date: String) -> String {
        guard let rawDate = convertDate(from: date) else {
            return ""
        }
        dateFormatter.dateFormat = "d MMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let date = dateFormatter.string(from: rawDate).replacingOccurrences(of: ".", with: ",")
        let weakDay = getWeakDay(from: rawDate)
        return "\(date) \(weakDay)"
    }
    
    func formatTime(date: String) -> String {
        let splitted = date.components(separatedBy: " ")
        guard splitted.count == 2 else {
            return ""
        }
        return splitted[1]
    }
    
    func getMonth(date: String) -> String {
        guard let rawDate = convertDate(from: date) else {
            return ""
        }
        dateFormatter.dateFormat = "d MMMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let month = dateFormatter.string(from: rawDate)
        return month + ","
    }
    
    private func getWeakDay(from date: Date) -> String {
        dateFormatter.dateFormat = "eee"
        let weakDay = dateFormatter.string(from: date).lowercased()
        return weakDay
    }
    
    private func convertDate(from dateString: String) -> Date? {
        let splitted = dateString.components(separatedBy: " ")
        guard splitted.count == 2 else {
            return nil
        }
        let rawDateString = splitted[0]
        dateFormatter.dateFormat = "yy-MM-dd"
        guard let rawDate = dateFormatter.date(from: rawDateString) else {
            return nil
        }
        return rawDate
    }
}
