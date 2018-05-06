//
//  MethodSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import brewdog

class MethodSpec: QuickSpec {
    
    override func spec() {
        
        var fermentation: Fermentation?
        beforeEach {
            let temp = Temp(unit: "celsius", value: 19)
            fermentation = Fermentation(temp: temp)
        }
        
        describe("Method") {
            it("should create a new Method") {
                let method = Method(fermentation: fermentation, mash: [], twist: "")
                expect(method).toNot(beNil())
            }
        }
        
        afterEach {
            
        }
    }
}
