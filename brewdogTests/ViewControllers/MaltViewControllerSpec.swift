//
//  MaltViewControllerSpec.swift
//  brewdogTests
//
//  Created by Lucas Correa on 07/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import brewdog

class MaltViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        var viewController: DisplayViewController!
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        beforeEach {
            let storyboard = UIStoryboard(name: "Main",
                                          bundle: Bundle.main)
            viewController = storyboard.instantiateViewController(withIdentifier: "DisplayViewController") as? DisplayViewController
            object_setClass(viewController, MaltViewController.self)
            
            window.makeKeyAndVisible()
            window.rootViewController = viewController
        }
        
        describe("MaltViewController") {
            describe(".viewDidLoad") {
                it ("should be presented") {
                    window.rootViewController?.viewDidLoad()
                    expect(window.rootViewController).toEventually(beAnInstanceOf(MaltViewController.self))
                }
            }
        }
    }
}
