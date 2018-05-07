//
//  HopValidatorSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 07/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import brewdog

class HopValidatorSpec: QuickSpec {
    
    override func spec() {
        
        var hopValidator: HopValidator?
        var hopMiddle: Hop?
        var hopEnd: Hop?
        var hopArray: [Hop]?
        
        beforeEach {
            
            //Hop
            hopMiddle = Hop(add: "middle", amount: Amount(unit: "kilograms", value: 1.92), attribute: "bitter", name: "Amarillo")
            hopEnd = Hop(add: "end", amount: Amount(unit: "kilograms", value: 1.92), attribute: "bitter", name: "Amarillo")
            
            //HopArray
            hopArray = []
            for index in 1...8 {
                let hop = Hop(add: (index % 2 == 0) ? "start" : "middle", amount: Amount(unit: "kilograms", value: 1.92), attribute: "bitter", name: "Amarillo")
                hop.state = (index % 2 == 0) ? State.IDLE.rawValue : State.DONE.rawValue
                hopArray?.append(hop)
            }
        }
        
        describe("HopValidator") {
            describe("A hop element with the attribute add=middle can’t be DONE until all the hops with add=start are done") {
                it("must false") {
                    hopValidator = HopValidator(withHop: hopMiddle!, list: hopArray!)
                   let isValid = hopValidator?.canChange()
                    
                    expect(isValid).to(equal(false))
                }
                
                it("must true") {
                    
                    for hop in hopArray! {
                        hop.state = State.DONE.rawValue
                    }
                    
                    hopValidator = HopValidator(withHop: hopMiddle!, list: hopArray!)
                    let isValid = hopValidator?.canChange()
                    
                    expect(isValid).to(equal(true))
                }
            }
            
            describe("A hop element with the attribute add=end can’t be DONE until all the hops with add=middle are done.") {
                it("must false") {
                    
                    for hop in hopArray! where hop.add == "middle" {
                        hop.state = (arc4random() % 2 == 0) ? State.IDLE.rawValue : State.DONE.rawValue
                    }
                    
                    hopValidator = HopValidator(withHop: hopEnd!, list: hopArray!)
                    let isValid = hopValidator?.canChange()
                    
                    expect(isValid).to(equal(false))
                }
                
                it("must true") {
                    
                    for hop in hopArray! {
                        hop.state = State.DONE.rawValue
                    }
                    
                    hopValidator = HopValidator(withHop: hopEnd!, list: hopArray!)
                    let isValid = hopValidator?.canChange()
                    
                    expect(isValid).to(equal(true))
                }
            }
        }
    }
}
