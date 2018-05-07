//
//  MethodViewModel.swift
//  brewdog
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import UIKit

class MethodViewModel: DataViewModel {
    
    //
    // MARK: - Properties
    var beer: Beer
    var timer = Timer()
    
    //
    // MARK: - Initializer
    init() {
        beer = Beer()
        
    }
    
    //
    // MARK: - Functions
    func updateMethodState(onCell cell:DisplayCell, indexPath:IndexPath) {
        
        if let state = beer.method?.mash?[indexPath.row].state {
            
            // Checks and changes the status of mash
            switch state {
            case MashState.IDLE.rawValue:
                beer.method?.mash?[indexPath.row].state = MashState.RUNNING.rawValue
                startTimer(index: indexPath.row)
            case MashState.RUNNING.rawValue:
                beer.method?.mash?[indexPath.row].state = MashState.PAUSE.rawValue
                timer.invalidate()
            case MashState.PAUSE.rawValue:
                beer.method?.mash?[indexPath.row].state = MashState.RUNNING.rawValue
                startTimer(index: indexPath.row)
            case MashState.DONE.rawValue:
                beer.method?.mash?[indexPath.row].state = MashState.IDLE.rawValue
            default:
                beer.method?.mash?[indexPath.row].state = MashState.IDLE.rawValue
            }
        }
        
        NotificationCenter.default.post(name: Notification.Name("updateCell"), object: indexPath.row)
    }
    
    func startTimer(index: Int) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer(timer:)), userInfo: index, repeats: true)
        RunLoop.main.add(timer, forMode: .commonModes)
    }
    
    @objc func updateTimer(timer: Timer) {
        let index = (timer.userInfo as? Int)!
        
        if let duration = beer.method?.mash?[index].countDown {
            if duration == 0 {
                timer.invalidate()
                beer.method?.mash?[index].state = MashState.DONE.rawValue
            } else {
                beer.method?.mash?[index].countDown = duration - 1
            }
        }
        
        NotificationCenter.default.post(name: Notification.Name("updateCell"), object: index)
    }
    
    //
    // MARK: - DataViewModel
    func name(indexPath: IndexPath) -> String {
        if let duration = beer.method?.mash?[indexPath.row].duration {
            if beer.method?.mash?[indexPath.row].state == MashState.IDLE.rawValue {
                beer.method?.mash?[indexPath.row].countDown = duration
            }
            
            return "Mash duration: \(duration) seconds"
        }
        return ""
    }
    
    func value(indexPath: IndexPath) -> String {
        if let value = beer.method?.mash?[indexPath.row].temp?.value, let unit = beer.method?.mash![indexPath.row].temp?.unit {
            return "\(value) \(unit)"
        }
        return ""
    }
    
    func extra(indexPath: IndexPath) -> String {
        if let countDown = beer.method?.mash?[indexPath.row].countDown {
            if beer.method?.mash?[indexPath.row].state == MashState.RUNNING.rawValue || beer.method?.mash?[indexPath.row].state == MashState.PAUSE.rawValue {
                return "CountDown: \(countDown)"
            }
        }
        return ""
    }
    
    func state(indexPath: IndexPath) -> String {
        if let state = beer.method?.mash?[indexPath.row].state {
            return state
        }
        return ""
    }
}
