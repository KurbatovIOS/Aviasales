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

class APIService {
    
    func fetchFlights(from: CityToFetch, to: CityToFetch, complition: @escaping (SearchResult?) -> Void) {
        let urlString = "https://nu.vsepoka.ru/api/search?origin=\(from.rawValue)&destination=\(to.rawValue)"
        guard let url = URL(string: urlString) else {
            // TODO: Handle error
            print("Error")
            return
        }
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                // TODO: Handle error
                print(error)
                complition(nil)
                return
            }
            
            guard let data = data else {
                // TODO: Handel error
                complition(nil)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(SearchResult.self, from: data)
                complition(decodedData)
            }
            catch {
                // TODO: Handle error
                print(error)
                complition(nil)
            }
        }
        dataTask.resume()
    }
}
