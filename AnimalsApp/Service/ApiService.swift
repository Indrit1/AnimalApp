//
//  ApiService.swift
//  AnimalsApp
//
//  Created by Indrit Saveta on 16.1.23.
//

import Combine
import Foundation

protocol APIService {
    func getAllAnimals(from endpoint: AnimalsAPI) -> AnyPublisher<[Animal], APIError>
}

struct ApiServiceImplementation: APIService {
    func getAllAnimals(from endpoint: AnimalsAPI) -> AnyPublisher<[Animal], APIError> {
        let jsonDecoder = JSONDecoder()
        // jsonDecoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError({ error in
            .custom(error: error)
            })
            .flatMap { data, response -> AnyPublisher<[Animal], APIError> in
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: .unknown)
                        .eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    return Just(data)
                        .decode(type: [Animal].self, decoder: jsonDecoder)
                        .mapError {_ in .decodingError}
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: .errorCode(response.statusCode))
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}
