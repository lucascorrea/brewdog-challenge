//
//  HopViewModelSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 07/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import brewdog

class HopViewModelSpec: QuickSpec {
    
    override func spec() {
        
        let hopViewModel: HopViewModel = HopViewModel()
        var cell: DisplayCell?
        var beer: Beer?
        
        beforeEach {
            cell = DisplayCell(style: .default, reuseIdentifier: "DisplayCell")
            
            //Hop
            var hopArray: [Hop]? = []
            for index in 1...4 {
                let hop = Hop(add: "start", amount: Amount(unit: "kilograms", value: 1.92), attribute: "bitter", name: "Amarillo")
                hop.state = (index % 2 == 0) ? State.IDLE.rawValue : State.DONE.rawValue
                hopArray?.append(hop)
            }
            
            let temp = Temp(unit: "celsius", value: 19)
            let fermentation = Fermentation(temp: temp)
            let method = Method(fermentation: fermentation, mash: [], twist: "")
            let ingredient = Ingredients(hops: hopArray, malt: [], yeast: "")
            
            beer = Beer(abv: 5.0, imageUrl: "", ingredients: ingredient, method: method, name: "Buzz")
            hopViewModel.beer = beer!
        }
        
        describe("HopViewModel") {
            describe("updateHopState") {
                it("should be updated the cell to a hop") {
                    let state1 = beer?.ingredients?.hops![0].state.description
                    hopViewModel.updateState(onCell: cell!, indexPath: IndexPath(row: 0, section: 0))
                    hopViewModel.updateState(onCell: cell!, indexPath: IndexPath(row: 1, section: 0))
                    let state2 = beer?.ingredients?.hops![0].state.description
                    expect(state1).toNot(equal(state2))
                }
            }
            
            describe("function get name") {
                it("should get the name of a hop") {
                    let name = hopViewModel.name(indexPath: IndexPath(row: 0, section: 0))
                    expect(name).notTo(beNil())
                }
            }
            
            describe("function get value") {
                it("should get the value of a hop") {
                    let name = hopViewModel.value(indexPath: IndexPath(row: 0, section: 0))
                    expect(name).notTo(beNil())
                }
            }
            
            describe("function get extra") {
                it("should get the extra of a hop") {
                    let name = hopViewModel.value(indexPath: IndexPath(row: 0, section: 0))
                    expect(name).notTo(beNil())
                }
            }
            
            describe("function get state") {
                it("should get the state of a hop") {
                    let name = hopViewModel.value(indexPath: IndexPath(row: 0, section: 0))
                    expect(name).notTo(beNil())
                }
            }
        }
    }
}
