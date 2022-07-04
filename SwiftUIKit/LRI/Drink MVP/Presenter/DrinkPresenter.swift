//
//  DrinkPresenter.swift
//  LRI
//
//  Created by Development on 04.07.2022.
//

import Foundation

protocol DrinkPresenterDelegate: AnyObject {
    func presentDrinks()
    func presentAlert(with title: String?, message: String)
}

class DrinkPresenter {
    weak var delegate: DrinkPresenterDelegate?
    private let model: DrinkModel = DrinkModel()
    
    init(view delegate: DrinkPresenterDelegate) {
        self.delegate = delegate
    }
}

extension DrinkPresenter {
    func setViewDelegate(_ delegate: DrinkPresenterDelegate) {
        self.delegate = delegate
    }
    func getDrinks() {
        NetworkLayer.request(endpoint: DrinkEndpoint.getDrinks) { [weak self] (result: Result<DrinkResponse, Error>) in
            switch result {
            case .success(let response):
                let drinks = response.drinks
                self?.model.fillData(with: drinks)
                self?.delegate?.presentDrinks()
            case .failure(let error):
                let title = "Something went wrong"
                self?.delegate?.presentAlert(with: title, message: error.localizedDescription)
            }
        }
    }
    /// Drink items for representing on table view controller
    var items: [DrinkItem] {
        self.model.items
    }
    /// Drink items count
    var count: Int {
        self.model.count
    }
}
