//
//  DrinkTableViewCell.swift
//  LRI
//
//  Created by Development on 03.07.2022.
//

import UIKit

class DrinkCell: UITableViewCell {
    
    static let identifier: String = "DrinkCell"
    
    @IBOutlet var previewImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var cachedUrl: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    // if the cell is reusable (has a reuse identifier), this is called just before the cell is returned from the table view method dequeueReusableCellWithIdentifier:. If you override, you MUST call super.
    override func prepareForReuse() {
        super.prepareForReuse()
        // Update activity indicator
        self.activityIndicator.startAnimating()
    }
    
}

extension DrinkCell {
    
    /// Decorator for displaying drink item cell
    func display(_ item: DrinkItem?) {
        guard let item = item else { return }
        
        defer { self.cachedUrl = item.strDrinkThumb }
        
        self.previewImageView.asyncImage(with: item.strDrinkThumb) { [weak self] image, isCached in
            guard let self = self else { return }
            if isCached || self.cachedUrl == item.strDrinkThumb {
                self.previewImageView.image = image
                self.activityIndicator.stopAnimating()
            }
        }
        
        self.descriptionLabel.text = item.strDrink
    }
    
}
