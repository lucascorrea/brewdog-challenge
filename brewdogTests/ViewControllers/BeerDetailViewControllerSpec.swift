//
//  BeerDetailViewControllerSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 07/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import brewdog

class BeerDetailViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        var viewController: BeerDetailViewController!
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        beforeEach {
            let storyboard = UIStoryboard(name: "Main",
                                          bundle: Bundle.main)
            viewController = storyboard.instantiateViewController(withIdentifier: "BeerDetailViewController") as? BeerDetailViewController
            
            window.makeKeyAndVisible()
            window.rootViewController = viewController
        }
        
        describe("BeerDetailViewController") {
            describe(".viewDidLoad") {
                it ("should be presented") {
                    window.rootViewController?.viewDidLoad()
                    expect(window.rootViewController).toEventually(beAnInstanceOf(BeerDetailViewController.self))
                }
            }
        }
    }
}
