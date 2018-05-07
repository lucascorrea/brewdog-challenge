//
//  MaltViewModel.swift
//  brewdog
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

class MaltViewModel: DataViewModel {

    //
    // MARK: - Properties
    var beer: Beer
    
    //
    // MARK: - Initializer
    init() {
        beer = Beer()
    }
    
    //
    // MARK: - Actions
    
    //
    // MARK: - DataViewModel
    func updateState(onCell cell:DisplayCell, indexPath:IndexPath) {
        if let state = beer.ingredients?.malt?[indexPath.row].state {
            
            // Checks and changes the status of Malt
            switch state {
            case State.IDLE.rawValue:
                beer.ingredients?.malt?[indexPath.row].state = State.DONE.rawValue
                cell.actionButton?.setTitle("DONE", for: .normal)
            case State.DONE.rawValue:
                beer.ingredients?.malt?[indexPath.row].state = State.IDLE.rawValue
                cell.actionButton?.setTitle("IDLE", for: .normal)
            default:
                print("")
            }
        }
    }
    
    func name(indexPath: IndexPath) -> String {
        if let name = beer.ingredients?.malt?[indexPath.row].name {
            return "\(name)"
        }
        return ""
    }
    
    func value(indexPath: IndexPath) -> String {
        if let value = beer.ingredients?.malt?[indexPath.row].amount?.value, let unit = beer.ingredients?.malt?[indexPath.row].amount?.unit {
            return "\(value) \(unit)"
        }
        return ""
    }
    
    func extra(indexPath: IndexPath) -> String {
        return ""
    }
    
    func state(indexPath: IndexPath) -> String {
        if let state = beer.ingredients?.malt?[indexPath.row].state {
            return state
        }
        return ""
    }
}
