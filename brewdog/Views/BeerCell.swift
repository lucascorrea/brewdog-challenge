//
//  BeerCell.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

class BeerCell: UITableViewCell {

    //
    // MARK: - Properties
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    
    //
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //
    // MARK: - Functions
    func configure(withViewModel viewModel:BrewdogListViewModel, indexPath: IndexPath) {
        
        let beer = viewModel.beerItems[indexPath.row]
        nameLabel.text = beer.name
        
        if let abv = beer.abv {
            abvLabel.text = "\(abv)%"
        }
        
        if let description = beer.description {
            detailLabel.text = description
        }
        
        if let image = beer.imageUrl {
            beerImageView.setImage(withUrl: image)
        }
    }

}
