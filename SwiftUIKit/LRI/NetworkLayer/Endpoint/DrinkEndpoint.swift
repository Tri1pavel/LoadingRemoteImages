//
//  DrinkEndpoint.swift
//  LRI
//
//  Created by Development on 01.07.2022.
//

import Foundation

enum DrinkEndpoint: Endpoint {
    case getDrinks
    
    var scheme: String {
        switch self {
        default :
            return "https"
        }
    }
    
    var method: String {
        switch self {
        case .getDrinks:
            return "GET"
        }
    }
    
    var baseURL: String {
        switch self {
        default :
            return "www.thecocktaildb.com"
        }
    }
    
    var path: String {
        switch self {
        case .getDrinks:
            return "/api/json/v1/1/filter.php"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .getDrinks:
            return [URLQueryItem(name: "a", value: "Alcoholic")]
        }
    }
}
