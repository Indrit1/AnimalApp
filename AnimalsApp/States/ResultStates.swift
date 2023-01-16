//
//  ResultStates.swift
//  AnimalsApp
//
//  Created by Indrit Saveta on 16.1.23.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Animal])
    case failed(error: Error)
}
