//
//  MaltViewModelSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 07/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import brewdog

class MaltViewModelSpec: QuickSpec {
    
    override func spec() {
        
        let matlViewModel: MaltViewModel = MaltViewModel()
        var cell: DisplayCell?
        var beer: Beer?
        
        beforeEach {
            cell = DisplayCell(style: .default, reuseIdentifier: "DisplayCell")
            
            //Malt
            var maltArray: [Malt]? = []
            for index in 1...4 {
                let malt = Malt(amount: Amount(unit: "kilograms", value: 1.92), name: "Amarillo")
                malt.state = (index % 2 == 0) ? State.IDLE.rawValue : State.DONE.rawValue
                maltArray?.append(malt)
            }
            
            let temp = Temp(unit: "celsius", value: 19)
            let fermentation = Fermentation(temp: temp)
            let method = Method(fermentation: fermentation, mash: [], twist: "")
            let ingredient = Ingredients(hops: [], malt: maltArray, yeast: "")
            
            beer = Beer(abv: 5.0, imageUrl: "", ingredients: ingredient, method: method, name: "Buzz")
            matlViewModel.beer = beer!
        }
        
        describe("MaltViewModel") {
            describe("updateMaltState") {
                it("should be updated the cell to a malt") {
                    let state1 = beer?.ingredients?.malt![0].state.description
                    matlViewModel.updateState(onCell: cell!, indexPath: IndexPath(row: 0, section: 0))
                    matlViewModel.updateState(onCell: cell!, indexPath: IndexPath(row: 1, section: 0))
                    let state2 = beer?.ingredients?.malt![0].state.description
                    expect(state1).toNot(equal(state2))
                }
            }
            
            describe("function get name") {
                it("should get the name of a malt") {
                    let name = matlViewModel.name(indexPath: IndexPath(row: 0, section: 0))
                    expect(name).notTo(beNil())
                }
            }
            
            describe("function get value") {
                it("should get the value of a malt") {
                    let name = matlViewModel.value(indexPath: IndexPath(row: 0, section: 0))
                    expect(name).notTo(beNil())
                }
            }
            
            describe("function get extra") {
                it("should get the extra of a malt") {
                    let name = matlViewModel.value(indexPath: IndexPath(row: 0, section: 0))
                    expect(name).notTo(beNil())
                }
            }
            
            describe("function get state") {
                it("should get the state of a malt") {
                    let name = matlViewModel.value(indexPath: IndexPath(row: 0, section: 0))
                    expect(name).notTo(beNil())
                }
            }
        }
    }
}
