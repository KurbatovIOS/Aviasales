//
//  FormatterServiceMock.swift
//  AviasalesUnitTests
//
//  Created by Kurbatov Artem on 23.07.2023.
//

@testable import Aviasales

final class FormatterServiceProtocolMock: FormatterServiceProtocol {

    var invokedFormatTicketCountMessage = false
    var invokedFormatTicketCountMessageCount = 0
    var invokedFormatTicketCountMessageParameters: (ticketCount: Int, Void)?
    var invokedFormatTicketCountMessageParametersList = [(ticketCount: Int, Void)]()
    var stubbedFormatTicketCountMessageResult: String! = ""

    func formatTicketCountMessage(ticketCount: Int) -> String {
        invokedFormatTicketCountMessage = true
        invokedFormatTicketCountMessageCount += 1
        invokedFormatTicketCountMessageParameters = (ticketCount, ())
        invokedFormatTicketCountMessageParametersList.append((ticketCount, ()))
        return stubbedFormatTicketCountMessageResult
    }

    var invokedFormatFlightDate = false
    var invokedFormatFlightDateCount = 0
    var invokedFormatFlightDateParameters: (date: String, Void)?
    var invokedFormatFlightDateParametersList = [(date: String, Void)]()
    var stubbedFormatFlightDateResult: String! = ""

    func formatFlightDate(date: String) -> String {
        invokedFormatFlightDate = true
        invokedFormatFlightDateCount += 1
        invokedFormatFlightDateParameters = (date, ())
        invokedFormatFlightDateParametersList.append((date, ()))
        return stubbedFormatFlightDateResult
    }

    var invokedFormatTime = false
    var invokedFormatTimeCount = 0
    var invokedFormatTimeParameters: (date: String, Void)?
    var invokedFormatTimeParametersList = [(date: String, Void)]()
    var stubbedFormatTimeResult: String! = ""

    func formatTime(date: String) -> String {
        invokedFormatTime = true
        invokedFormatTimeCount += 1
        invokedFormatTimeParameters = (date, ())
        invokedFormatTimeParametersList.append((date, ()))
        return stubbedFormatTimeResult
    }

    var invokedGetMonth = false
    var invokedGetMonthCount = 0
    var invokedGetMonthParameters: (date: String, Void)?
    var invokedGetMonthParametersList = [(date: String, Void)]()
    var stubbedGetMonthResult: String! = ""

    func getMonth(date: String) -> String {
        invokedGetMonth = true
        invokedGetMonthCount += 1
        invokedGetMonthParameters = (date, ())
        invokedGetMonthParametersList.append((date, ()))
        return stubbedGetMonthResult
    }
}
