//
//  BrewdogListViewController.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

class BrewdogListViewController: UIViewController {

    //
    // MARK: - Properties
    lazy var brewdogListViewModel: BrewdogListViewModel = {
        let brewdogListViewModel = BrewdogListViewModel()
        return brewdogListViewModel
    }()
    
    @IBOutlet weak var beerTableView: UITableView!
    
    //
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Loading.show(view: UIApplication.shared.keyWindow!)
        
        //Get list of beers
        brewdogListViewModel.list(success: { _ in
            Loading.close(view: UIApplication.shared.keyWindow!)
            self.beerTableView.reloadData()
        }, failure: { response, object, error in
            Loading.close(view: UIApplication.shared.keyWindow!)
            print("\(String(describing: response)) \(String(describing: object)) \(String(describing: error))")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    // MARK: - UIStoryboardSegueDelegate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let destination: BeerDetailViewController = (segue.destination as? BeerDetailViewController)!
            if let beer = sender as? Beer {
                destination.beerDetailViewModel.beer = beer
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension BrewdogListViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brewdogListViewModel.beerItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BeerCell = (tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as? BeerCell)!
        cell.configure(withViewModel: brewdogListViewModel, indexPath: indexPath)
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
        let beer = self.brewdogListViewModel.beerItems[indexPath.row]
        self.performSegue(withIdentifier: "detailSegue", sender: beer)
    }
}
