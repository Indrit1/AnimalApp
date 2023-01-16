//
//  RelewayFont.swift
//  AnimalsApp
//
//  Created by Indrit Saveta on 16.1.23.
//

import Foundation
import SwiftUI
enum RalewayFont {
    
    static let header = Font.custom(Raleway.extraBold.weight, size: 40)
    static let header2 = Font.custom(Raleway.extraBold.weight, size: 30)
    static let title = Font.custom(Raleway.bold.weight, size: 32)
    static let title2 = Font.custom(Raleway.extraBold.weight, size: 22)
    static let subtitle = Font.custom(Raleway.bold.weight, size: 16)
    static let body = Font.custom(Raleway.regular.weight, size: 17)
    static let footnote = Font.custom(Raleway.regular.weight, size: 16)
    static let footnote2 = Font.custom(Raleway.regular.weight, size: 14)
    static let footnoteSmall = Font.custom(Raleway.regular.weight, size: 12)
    
    static var custom: (Raleway, CGFloat) -> RalewayFont = { (weight, size) in
        return RalewayFont.custom(Raleway(rawValue: weight.weight)!, size)
    }
}

enum Raleway: String {
    
    case black = "Raleway-Black"
    case extraBold = "Raleway-ExtraBold"
    case bold = "Raleway-Bold"
    case semiBold = "Raleway-SemiBold"
    case medium = "Raleway-Medium"
    case regular = "Raleway-Regular"
    case light = "Raleway-Light"
    case thick = "Raleway-Thick"
    case thin = "Raleway-Thin"
    
    var weight: String { return self.rawValue }
}
