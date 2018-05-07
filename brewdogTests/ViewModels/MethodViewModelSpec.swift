//
//  MethodViewModelSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 07/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import brewdog

class MethodViewModelSpec: QuickSpec {
    
    override func spec() {
        
        let methodViewModel: MethodViewModel = MethodViewModel()
        var cell: DisplayCell?
        var beer: Beer?
        
        beforeEach {
            cell = DisplayCell(style: .default, reuseIdentifier: "DisplayCell")
            
            //Mash
            var mashArray: [Mash]? = []
            for index in 1...4 {
                let mash = Mash(duration: 20, temp: Temp(unit: "celsius", value: 19), countDown: 70)
                mash.state = (index % 2 == 0) ? MashState.IDLE.rawValue : MashState.DONE.rawValue
                mashArray?.append(mash)
            }
            
            let temp = Temp(unit: "celsius", value: 19)
            let fermentation = Fermentation(temp: temp)
            let method = Method(fermentation: fermentation, mash: mashArray, twist: "")
            let ingredient = Ingredients(hops: [], malt: [], yeast: "")
            
            beer = Beer(abv: 5.0, imageUrl: "", ingredients: ingredient, method: method, name: "Buzz")
            methodViewModel.beer = beer!
        }
        
        describe("MethodViewModel") {
            describe("updateMethodState") {
                it("should be updated to DONE the cell to a method") {
                    //From DONE to IDLE
                    methodViewModel.updateMethodState(onCell: cell!, indexPath: IndexPath(row: 0, section: 0))
                    let state = beer?.method?.mash![0].state.description
                    expect(state).to(equal(MashState.IDLE.rawValue))
                }
                
                it("should be updated to RUNNING the cell to a method") {
                    //From RUNNING to PAUSE
                    beer?.method?.mash![0].state = MashState.RUNNING.rawValue
                    methodViewModel.updateMethodState(onCell: cell!, indexPath: IndexPath(row: 0, section: 0))
                    let state = beer?.method?.mash![0].state.description
                    expect(state).to(equal(MashState.PAUSE.rawValue))
                }
                
                it("should be updated to PAUSE the cell to a method") {
                    //From PAUSE to RUNNING
                    beer?.method?.mash![0].state = MashState.PAUSE.rawValue
                    methodViewModel.updateMethodState(onCell: cell!, indexPath: IndexPath(row: 0, section: 0))
                    let state = beer?.method?.mash![0].state.description
                    expect(state).to(equal(MashState.RUNNING.rawValue))
                }
                
                it("should be updated to IDLE the cell to a method") {
                    //From IDLE to RUNNING
                    beer?.method?.mash![0].state = MashState.IDLE.rawValue
                    methodViewModel.updateMethodState(onCell: cell!, indexPath: IndexPath(row: 0, section: 0))
                    let state = beer?.method?.mash![0].state.description
                    expect(state).to(equal(MashState.RUNNING.rawValue))
                }
                
                it("should be updated to unknown the cell to a method") {
                    
                    beer?.method?.mash![0].state = ""
                    methodViewModel.updateMethodState(onCell: cell!, indexPath: IndexPath(row: 0, section: 0))
                    let state = beer?.method?.mash![0].state.description
                    expect(state).to(equal(MashState.IDLE.rawValue))
                }
            }
            
            describe("function get name") {
                it("should get the name of a method") {
                    let name = methodViewModel.name(indexPath: IndexPath(row: 0, section: 0))
                    expect(name).notTo(beNil())
                }
            }

            describe("function get value") {
                it("should get the value of a method") {
                    let name = methodViewModel.value(indexPath: IndexPath(row: 0, section: 0))
                    expect(name).notTo(beNil())
                }
            }

            describe("function get extra") {
                it("should get the extra of a method") {
                    let name = methodViewModel.value(indexPath: IndexPath(row: 0, section: 0))
                    expect(name).notTo(beNil())
                }
            }

            describe("function get state") {
                it("should get the state of a method") {
                    let name = methodViewModel.value(indexPath: IndexPath(row: 0, section: 0))
                    expect(name).notTo(beNil())
                }
            }
        }
    }
}
