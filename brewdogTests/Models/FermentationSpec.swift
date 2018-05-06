//
//  FermentationSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import brewdog

class FermentationSpec: QuickSpec {
    
    override func spec() {
        
        var temp: Temp?
        
        beforeEach {
            temp = Temp(unit: "celsius", value: 70)
        }
        
        describe("Fermentation") {
            it("should create a new Fermentation") {
                let fermentation = Fermentation(temp: temp)
                expect(fermentation).toNot(beNil())
            }
        }
        
        afterEach {
            
        }
    }
}
