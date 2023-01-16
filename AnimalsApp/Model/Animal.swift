//
//  AnimalModel.swift
//  AnimalsApp
//
//  Created by Indrit Saveta on 16.1.23.
//

import SwiftUI

struct Animal: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  let description: String
  let link: String
  let image: String
  let gallery: [String]
  let fact: [String]
}
