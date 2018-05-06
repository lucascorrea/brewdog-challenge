//
//  IngredientSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 06/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import brewdog

class IngredientsSpec: QuickSpec {
    
    override func spec() {
        
        beforeEach {
            
        }
        
        describe("Ingredient") {
            it("should create a new Ingredient") {
                let ingredients = Ingredients(hops: [], malt: [], yeast: "Wyeast 1056 - American Ale")
                expect(ingredients).toNot(beNil())
            }
        }
        
        afterEach {
            
        }
    }
}
