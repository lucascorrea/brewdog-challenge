//
//  BoilSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import brewdog

class BoilSpec: QuickSpec {
    
    override func spec() {
        
        beforeEach {
            
        }
        
        describe("Boil") {
            it("should create a new Boil") {
                let boil = Boil(unit: "liters", value: 20)
                expect(boil).toNot(beNil())
            }
        }
        
        afterEach {
            
        }
    }
}
