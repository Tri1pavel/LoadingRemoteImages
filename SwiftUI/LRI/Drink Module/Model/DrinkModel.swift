//
//  DrinkModel.swift
//  LRI
//
//  Created by Development on 02.07.2022.
//

import Foundation

class DrinkModel: ObservableObject {
    @Published
    private(set) var items: [DrinkItem] = []
    
    required init(items: [DrinkItem] = []) {
        self.items = items
    }
    
    private func fillData(with items: [DrinkItem]) {
        self.items = items
    }
}
