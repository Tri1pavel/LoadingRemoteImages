//
//  DrinkPresenter.swift
//  LRI
//
//  Created by Development on 04.07.2022.
//

import Foundation

protocol DrinkViewProtocol: AnyObject {
    func presentDrinks()
    func presentAlert(with title: String?, message: String)
}

protocol DrinkViewPresenterProtocol: AnyObject {
    var items: [DrinkItem] { get }
    var count: Int { get }
    
    func getDrinks()
}

class DrinkPresenter {
    private weak var delegate: DrinkViewProtocol?
    private let networkAPI: NetworkDataFetchableProtocol
    private let model: DrinkModel
    
    required init(view delegate: DrinkViewProtocol,
                  networkAPI: NetworkDataFetchableProtocol) {
        self.delegate = delegate
        self.networkAPI = networkAPI
        self.model = DrinkModel()
    }
}

extension DrinkPresenter: DrinkViewPresenterProtocol {
    /// Drink items for representing on table view controller
    var items: [DrinkItem] {
        self.model.items
    }
    /// Drink items count
    var count: Int {
        self.model.count
    }
    /// Fetch drink items
    func getDrinks() {
        self.networkAPI.performRequest(endpoint: DrinkEndpoint.getDrinks) { [weak self] (result: Result<DrinkResponse, Error>) in
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
}
