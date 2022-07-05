//
//  DrinksTableViewController.swift
//  LRI
//
//  Created by Development on 01.07.2022.
//

import UIKit

class DrinksTableViewController: UITableViewController {
    private var presenter: DrinkViewPresenterProtocol? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        self.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        presenter = DrinkPresenter(view: self, networkAPI: NetworkLayer.shared)
        presenter?.getDrinks()
    }
    
    @objc
    func refresh(sender:AnyObject) {
        presenter?.getDrinks()
    }
    
}

// MARK: TableViewControllerDataSource
extension DrinksTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.count ?? Int()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DrinkCell.identifier,
                                                       for: indexPath) as? DrinkCell else {
            return UITableViewCell()
        }
        
        let item = presenter?.items[indexPath.row]
        
        cell.display(item)
        
        return cell
    }
}

// MARK: DrinkViewProtocol
extension DrinksTableViewController: DrinkViewProtocol {
    func presentDrinks() {
        DispatchQueue.main.async {
            defer { self.refreshControl?.endRefreshing() }
            self.tableView.reloadData()
        }
    }
    
    func presentAlert(with title: String?, message: String) {
        DispatchQueue.main.async {
            defer { self.refreshControl?.endRefreshing() }
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            self.present(alert, animated: true)
        }
    }
}
