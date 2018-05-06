//
//  DisplayCell.swift
//  brewdog
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

protocol DisplayCellDelegate: class {
    func didChangeState(onCell cell: DisplayCell)
}

class DisplayCell: UITableViewCell {

    //
    // MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var extraLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    weak var delegate: DisplayCellDelegate?
    
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
    func configure(withViewModel viewModel:DataViewModel, indexPath: IndexPath, cellDelegate: DisplayCellDelegate) {
        delegate = cellDelegate
        nameLabel.text = viewModel.name(indexPath: indexPath)
        valueLabel.text = viewModel.value(indexPath: indexPath)
        actionButton.setTitle(viewModel.state(indexPath: indexPath), for: .normal)
        extraLabel.text = viewModel.extra(indexPath: indexPath)
    }
    
    //
    // MARK: - Actions
    @IBAction func executeAction(_ sender: Any) {
        delegate?.didChangeState(onCell: self)
    }
}
