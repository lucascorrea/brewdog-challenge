//
//  BrewdogListViewController.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

class BrewdogListViewController: UIViewController {

    
    let brewdogListViewModel = BrewdogListViewModel()
    
    @IBOutlet weak var beerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brewdogListViewModel.list(success: { beers in
            self.beerTableView.reloadData()
        }) { (response, object, error) in
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UITableViewDataSource
extension BrewdogListViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brewdogListViewModel.beerItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BeerCell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as! BeerCell
        brewdogListViewModel.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension BrewdogListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

