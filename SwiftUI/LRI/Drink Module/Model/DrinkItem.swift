//
//  DrinkItem.swift
//  LRI
//
//  Created by Development on 01.07.2022.
//

import Foundation

struct DrinkResponse: Codable {
    var drinks: [DrinkItem]
}

struct DrinkItem: Codable {
    var strDrink: String
    var strDrinkThumb: String
    var idDrink: String
}
