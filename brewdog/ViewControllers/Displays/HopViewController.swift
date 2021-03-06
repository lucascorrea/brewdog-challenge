//
//  HopViewController.swift
//  brewdog
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

class HopViewController: DisplayViewController, DisplayCellDelegate {

    //
    // MARK: - Properties
    lazy var hopViewModel: HopViewModel = {
        let hopViewModel = HopViewModel()
        return hopViewModel
    }()
    
    //
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    // MARK: - Functions
    override func setBeer(beer: Beer) {
        hopViewModel.beer = beer
    }
    
    //
    // MARK: - DisplayCellDelegate
    func didChangeState(onCell cell: DisplayCell) {
        if let indexPath = tableview.indexPath(for: cell) {
            hopViewModel.updateState(onCell: cell, indexPath: indexPath)
        }
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hopViewModel.beer.ingredients?.hops?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DisplayCell = (tableView.dequeueReusableCell(withIdentifier: "DisplayCell", for: indexPath) as? DisplayCell)!
        
        let viewModel: DataViewModel = hopViewModel
        cell.configure(withViewModel: viewModel, indexPath: indexPath, cellDelegate: self)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

}
