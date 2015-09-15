//
//  ViewController.swift
//  ForceTouch
//
//  Created by Dal Rupnik on 14/09/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var touchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.traitCollection.forceTouchCapability == .Available {
            print("I support force touch!")
        }
        else {
            print("I do not support force touch!")
        }
        
        let shallowRecognizer = USSForceGestureRecognizer(target: self, action: "forceTouchDeepRecognized:")
        shallowRecognizer.touchType = .Shallow
        
        let deepRecognizer = USSForceGestureRecognizer(target: self, action: "forceTouchShallowRecognized:")
        deepRecognizer.touchType = .Deep
        
        self.touchView.addGestureRecognizer(shallowRecognizer)
        self.touchView.addGestureRecognizer(deepRecognizer)
    }
    
    func forceTouchDeepRecognized (recognizer: UIGestureRecognizer) {
        
        if let _ = recognizer as? USSForceGestureRecognizer {
            print("Force Touch Deep Recognized...")
        }
    }
    
    func forceTouchShallowRecognized (recognizer: UIGestureRecognizer) {
        if let _ = recognizer as? USSForceGestureRecognizer {
            print("Force Touch Shallow Recognized...")
        }
    }
}
