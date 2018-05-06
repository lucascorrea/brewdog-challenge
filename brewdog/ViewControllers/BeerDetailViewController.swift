//
//  BeerDetailViewController.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {

    //
    // MARK: - Properties
    let beerDetailViewModel = BeerDetailViewModel()
    var displayViewController: DisplayViewController?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var abvLabel: UILabel!
    
    //
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showBeer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    // MARK: - Functions
    func showBeer() {
        self.beerImageView.setImage(withUrl: beerDetailViewModel.beerImageUrl())
        self.nameLabel.text = beerDetailViewModel.beerName()
        self.detailTextView.text = beerDetailViewModel.beerDetail()
        self.abvLabel.text = beerDetailViewModel.beerAbv()
    }
    
    //
    // MARK: - UIStoryboardSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        displayViewController = segue.destination as? DisplayViewController
        
        if segue.identifier == "methodSegue" {
            object_setClass(displayViewController, MethodViewController.self)
        }
        
        if segue.identifier == "hopSegue" {
            object_setClass(displayViewController, HopViewController.self)
        }
        
        if segue.identifier == "maltSegue" {
            object_setClass(displayViewController, MaltViewController.self)
        }
        
        displayViewController?.popoverPresentationController?.delegate = displayViewController
        displayViewController?.setBeer(beer: beerDetailViewModel.beer)
    }

}
