//
//  ApiEndpoint.swift
//  AnimalsApp
//
//  Created by Indrit Saveta on 16.1.23.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum AnimalsAPI {
    case getAnimalsEN
    case getAnimalsDE
}

extension AnimalsAPI: APIBuilder {
    
    var baseUrl: URL {
        switch self {
        case .getAnimalsEN:
            return URL(string: Config.baseUrl)!
        case .getAnimalsDE:
            return URL(string: "Empty, No url")!
        }
    }
    
    var path: String {
        switch self {
        case .getAnimalsEN:
            return Config.pathUrlGetAnimalsEN
            
        case .getAnimalsDE:
            return Config.pathUrlGetAnimalsDe
        }
    }
    
    var urlRequest: URLRequest {
        switch self {
        case .getAnimalsEN, .getAnimalsDE:
            return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        }
    }
}
