//
//  MashSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import brewdog

class MashSpec: QuickSpec {
    
    override func spec() {
        
        beforeEach {
            
        }
        
        describe("Mash") {
            it("should create a new Mash") {
                let mash = Mash()
                expect(mash).toNot(beNil())
            }
        }
        
        afterEach {
            
        }
    }
}
