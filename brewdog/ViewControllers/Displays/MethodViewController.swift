//
//  MethodViewController.swift
//  brewdog
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

class MethodViewController: DisplayViewController, DisplayCellDelegate {
    
    //
    // MARK: - Properties
    lazy var methodViewModel: MethodViewModel = {
        let methodViewModel = MethodViewModel()
        return methodViewModel
    }()
    
    //
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: Notification.Name("updateCell"), object: nil, queue: OperationQueue.main) { (notification) in
            self.tableview.reloadData()
            
            let indexPath = IndexPath(row: notification.object as! Int, section: 0)
            
            // Updates the title of button
            if let state = self.methodViewModel.beer.method?.mash?[indexPath.row].state {
                let cell: DisplayCell = self.tableview.cellForRow(at:indexPath) as! DisplayCell
                cell.actionButton.setTitle(state, for: .normal)
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    // MARK: - Functions
    override func setBeer(beer: Beer) {
        methodViewModel.beer = beer
    }

    //
    // MARK: - DisplayCellDelegate
    func didChangeState(onCell cell: DisplayCell) {
        if let indexPath = tableview.indexPath(for: cell) {
            methodViewModel.updateMethodState(onCell: cell, indexPath: indexPath)
        }
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return methodViewModel.beer.method?.mash?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DisplayCell = tableView.dequeueReusableCell(withIdentifier: "DisplayCell", for: indexPath) as! DisplayCell
        
        let viewModel: DataViewModel? = methodViewModel
        cell.configure(withViewModel: viewModel!, indexPath: indexPath, cellDelegate: self)
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
