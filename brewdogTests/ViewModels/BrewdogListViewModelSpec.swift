//
//  BrewdogListViewModelSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 07/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import brewdog

class BrewdogListViewModelSpec: QuickSpec {
    
    override func spec() {
        
        let brewdogListViewModel: BrewdogListViewModel = BrewdogListViewModel()
        
        beforeEach {
            
        }
        
        describe("BrewdogListViewModel") {
            describe("get list of beers") {
                it("should return a list of beers") {
                    waitUntil(timeout: 60) { done in
                        brewdogListViewModel.list(success: { (suc) in
                            expect(suc).toNot(beNil())
                            done()
                        },failure: { (_, _, _) in
                        })
                    }
                }
            }
        }
    }
}
