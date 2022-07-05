//
//  DrinkModel.swift
//  LRI
//
//  Created by Development on 02.07.2022.
//

import Foundation

class DrinkModel: ObservableObject {
    private let networkAPI: NetworkDataFetchableProtocol
    private(set) var networkError: String? = nil
    @Published
    private(set) var items: [DrinkItem] = []
    
    required init(networkAPI: NetworkDataFetchableProtocol,
                  items: [DrinkItem] = []) {
        self.networkAPI = networkAPI
        self.items = items
    }
    
    private func fillData(with items: [DrinkItem]) {
        DispatchQueue.main.async {
            self.items = items
        }
    }
}

extension DrinkModel {
    /// Fetch drink items
    func getDrinks(completionHandler: @escaping (Error?) -> Void) {
        self.networkAPI.performRequest(endpoint: DrinkEndpoint.getDrinks) { [weak self] (result: Result<DrinkResponse, Error>) in
            switch result {
            case .success(let response):
                let drinks = response.drinks
                self?.fillData(with: drinks)
            case .failure(let error):
                self?.networkError = error.localizedDescription
                completionHandler(error)
            }
        }
    }
}

