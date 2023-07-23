//
//  APIService.swift
//  Aviasales
//
//  Created by Kurbatov Artem on 20.07.2023.
//

import Foundation

enum CityToFetch: String {
    case moscow = "MOW"
    case spb = "LED"
}

protocol APIServiceProtocol {
    func fetchFlights(from: CityToFetch, to: CityToFetch, complition: @escaping (SearchResult?) -> Void)
}

class APIService: APIServiceProtocol {
    
    func fetchFlights(from: CityToFetch, to: CityToFetch, complition: @escaping (SearchResult?) -> Void) {
        let urlString = "https://nu.vsepoka.ru/api/search?origin=\(from.rawValue)&destination=\(to.rawValue)"
        guard let url = URL(string: urlString) else {
            print("Unable to create URL from string")
            return
        }
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("URL session error:\n\(String(describing: error))")
                complition(nil)
                return
            }
            
            guard let data = data else {
                print("URL session data error)")
                complition(nil)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(SearchResult.self, from: data)
                complition(decodedData)
            }
            catch {
                print("Decoding API data error:\n\(error)")
                complition(nil)
            }
        }
        dataTask.resume()
    }
}
