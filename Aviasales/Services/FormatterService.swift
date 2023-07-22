//
//  FormatterService.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 21.07.2023.
//

import Foundation

class FormatterService {
    
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
    
    func formatFlightDate(date: String) -> String? {
        guard let rowDate = convertDate(from: date) else {
            return nil
        }
        dateFormatter.dateFormat = "d MMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let date = dateFormatter.string(from: rowDate).replacingOccurrences(of: ".", with: ",")
        let weakDay = getWeakDay(from: rowDate)
        return "\(date) \(weakDay ?? "")"
    }
    
    func formatTime(date: String) -> String? {
        let splitted = date.components(separatedBy: " ")
        guard splitted.count == 2 else {
            return nil
        }
        return splitted[1]
    }
    
    func getMonth(date: String) -> String? {
        guard let rowDate = convertDate(from: date) else {
            return nil
        }
        dateFormatter.dateFormat = "d MMMM"
        let month = dateFormatter.string(from: rowDate)
        return month + ","
    }
    
    private func getWeakDay(from date: Date) -> String? {
        dateFormatter.dateFormat = "eee"
        let weakDay = dateFormatter.string(from: date).lowercased()
        return weakDay
    }
    
    private func convertDate(from dateString: String) -> Date? {
        let splitted = dateString.components(separatedBy: " ")
        guard splitted.count == 2 else {
            return nil
        }
        let rowDateString = splitted[0]
        dateFormatter.dateFormat = "yy-MM-dd"
        guard let rowDate = dateFormatter.date(from: rowDateString) else {
            return nil
        }
        return rowDate
    }
}
