//
//  MethodViewControllerSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 07/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import brewdog

class MethodViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        var viewController: DisplayViewController!
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        beforeEach {
            let storyboard = UIStoryboard(name: "Main",
                                          bundle: Bundle.main)
            viewController = storyboard.instantiateViewController(withIdentifier: "DisplayViewController") as? DisplayViewController
            object_setClass(viewController, MethodViewController.self)
            
            window.makeKeyAndVisible()
            window.rootViewController = viewController
        }
        
        describe("MethodViewController") {
            describe(".viewDidLoad") {
                it ("should be presented") {
                    viewController.loadViewIfNeeded()
                     expect(window.rootViewController).toEventually(beAnInstanceOf(MethodViewController.self))
                }
            }
        }
    }
}
