//
//  USSForceGestureRecognizer.swift
//  ForceTouch
//
//  Created by Dal Rupnik on 15/09/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

@available(iOS 9.0, *)
public enum USSForceTouch {
    case Shallow
    case Deep
}

///
/// Force touch recognizer
///
@available(iOS 9.0, *)
public class USSForceGestureRecognizer : UIGestureRecognizer {
    
    private static let averageTouchForce : CGFloat = 1.0
    
    public var numberOfTouchesRequired: Int = 1
    public var touchType : USSForceTouch = .Shallow
    
    
    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        
        var isValid = true
        
        for touch in touches {
            if !isValidForceTouch(touch) {
                isValid = false
            }
            print("Force: \(touch.force) Max: \(touch.maximumPossibleForce)")
        }
        
        if isValid && touches.count == numberOfTouchesRequired {
            state = .Possible
        }
        else {
            state = .Failed
        }
    }
    
    override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent) {
        super.touchesEnded(touches, withEvent: event)
        
        if state == .Possible {
            state = .Ended
        }
        else if state != .Failed {
            state = .Failed
        }
    }
    
    private func isValidForceTouch(touch: UITouch) -> Bool {
        
        //
        // Calculate a difference factor for different force levels
        //
        
        let difference = (touch.maximumPossibleForce - USSForceGestureRecognizer.averageTouchForce) / 2.0
        
        // If we are at average level, force touch is not valid
        if touch.force <= USSForceGestureRecognizer.averageTouchForce {
            return false
        }
        
        if touchType == .Shallow {
            // For a shallow force touch, we need to be smaller than average + difference
            return touch.force < USSForceGestureRecognizer.averageTouchForce + difference
        }
        else {
            // For a deep force touch, we need to be more than average + difference
            return touch.force > USSForceGestureRecognizer.averageTouchForce + difference
        }
    }
    
}