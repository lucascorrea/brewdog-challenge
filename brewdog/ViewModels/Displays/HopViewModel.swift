//
//  HopViewModel.swift
//  brewdog
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

class HopViewModel: DataViewModel {

    //
    // MARK: - Properties
    var beer: Beer
    
    //
    // MARK: - Initializer
    init() {
        beer = Beer()
    }
    
    //
    // MARK: - Functions
    func updateHopState(onCell cell:DisplayCell, indexPath:IndexPath) {
        if let hop = beer.ingredients?.hops?[indexPath.row], let array = beer.ingredients?.hops {
            
            // Validator 
            let validator = HopValidator(withHop: hop, list: array)
            
            if validator.canChange() {
                if let state = beer.ingredients?.hops?[indexPath.row].state {
                    
                    // Checks and changes the status of hop
                    switch state {
                    case State.IDLE.rawValue:
                        beer.ingredients?.hops?[indexPath.row].state = State.DONE.rawValue
                        cell.actionButton.setTitle("DONE", for: .normal)
                        break
                        
                    case State.DONE.rawValue:
                        beer.ingredients?.hops?[indexPath.row].state = State.IDLE.rawValue
                        cell.actionButton.setTitle("IDLE", for: .normal)
                        break
                        
                    default:
                        print("")
                    }
                }
            } else {
                print("Can't change")
            }
        }
    }
    
    //
    // MARK: - DataViewModel
    func name(indexPath: IndexPath) -> String {
        if let name = beer.ingredients?.hops?[indexPath.row].name {
            return "\(name)"
        }
        return ""
    }
    
    func value(indexPath: IndexPath) -> String {
        if let value = beer.ingredients?.hops?[indexPath.row].amount?.value, let unit = beer.ingredients?.hops![indexPath.row].amount?.unit {
            return "\(value) \(unit)"
        }
        return ""
    }
    
    func extra(indexPath: IndexPath) -> String {
        if let position = beer.ingredients?.hops?[indexPath.row].add {
            return "Position: \(position)"
        }
        return ""
    }
    
    func state(indexPath: IndexPath) -> String {
        if let state = beer.ingredients?.hops?[indexPath.row].state {
            return state
        }
        return ""
    }
}
