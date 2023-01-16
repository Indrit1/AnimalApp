//
//  NetworkError.swift
//  AnimalsApp
//
//  Created by Indrit Saveta on 16.1.23.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
    case custom(error: Error)
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Failed to decode the error from the service"
        case .errorCode(let code):
            return "\(code) - Something went wrong"
        case .unknown:
            return "The error is unknown"
        case .custom(let error):
            return error.localizedDescription
        }
    }
}
