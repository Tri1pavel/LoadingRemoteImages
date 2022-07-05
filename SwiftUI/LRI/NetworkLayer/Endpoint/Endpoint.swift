//
//  Endpoint.swift
//  LRI
//
//  Created by Development on 01.07.2022.
//

import Foundation

protocol Endpoint {
    // http / https
    var scheme: String { get }
    
    // GET / POST / ...
    var method: String { get }
    
    // Sample: www.thecocktaildb.com
    var baseURL: String { get }
    
    // Sample: /api/json/v1/1/filter.php
    var path: String { get }
    
    // Sample: [URLQueryItem(name: a, value: Alcoholic)]
    var parameters: [URLQueryItem]? { get }
}
