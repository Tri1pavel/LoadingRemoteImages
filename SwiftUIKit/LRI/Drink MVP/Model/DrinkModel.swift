//
//  DrinkModel.swift
//  LRI
//
//  Created by Development on 02.07.2022.
//

import Foundation

protocol DrinkModelDataAccess {
    var items: [DrinkItem] { get }
    var count: Int { get }
}

class DrinkModel: DrinkModelDataAccess {
    private(set) var items: [DrinkItem] = []
    var count: Int { items.count }
    
    init(items: [DrinkItem] = []) {
        self.items = items
    }
}

extension DrinkModel {
    func fillData(with items: [DrinkItem]) {
        self.items = items
    }
}
