//
//  VolumeSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import brewdog

class VolumeSpec: QuickSpec {
    
    override func spec() {
        
        beforeEach {
            
        }
        
        describe("Volume") {
            it("should create a new Volume") {
                let volume = Volume(unit: "liters", value: 20)
                expect(volume).toNot(beNil())
            }
        }
        
        afterEach {
            
        }
    }
}
