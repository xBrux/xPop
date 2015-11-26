//
//  BruxPopObject.swift
//  imeican
//
//  Created by BRUX on 7/3/15.
//  Copyright (c) 2015 Meican Co., Ltd. All rights reserved.
//

import UIKit

let USE_MAX_DURATION = -81205.8981

public class BruxPopObject {

    private var delayTimeMark: Double = 0
    private var defaultAnimationDuration: Double = 0.4
    private var animations = [POPAnimation]()
    private var autoDelay:Bool = false
    let target:NSObject
    
    init(target:NSObject) {
        self.target = target
        target.pop_removeAllAnimations()
    }
    
        
    //MARK: - Progress
    let progressProp = POPAnimatableProperty.propertyWithName("BruxPopProgressProp", initializer: { (prop:POPMutableAnimatableProperty!) -> Void in
        prop.readBlock = { (obj:AnyObject!,values:UnsafeMutablePointer<CGFloat>) in
            values[0] = (obj as! BruxPopProgressView).progress
        }
        
        prop.writeBlock = {(obj:AnyObject!,values:UnsafePointer<CGFloat>) in
            (obj as! BruxPopProgressView).progress = values[0]
        }
        
        prop.threshold = 0.01
    }) as! POPAnimatableProperty
    
    public func progressTo(progress:CGFloat, duration:NSTimeInterval? = nil) -> Self {
        if let _ = target as? BruxPopProgressView {
            let anim = POPBasicAnimation()
            anim.duration = duration ?? 0.4
            anim.property = progressProp
            anim.toValue = progress
            addAnims([anim], autoDelay: anim.duration)
        }
        return self
    }
    
    public func springProgressTo(progress:CGFloat, speed:CGFloat = 20, bounciness:CGFloat = 15) -> Self {
        if let _ = target as? BruxPopProgressView {
            let anim = POPSpringAnimation()
            anim.property = progressProp
            anim.toValue = progress
            anim.springSpeed = speed
            anim.springBounciness = bounciness
            addAnims([anim], autoDelay: 0)
        }
        return self
    }

    
    
    //MARK: - Basic APIs
    public func go(completion completion:((POPAnimation!, Bool)->())? = nil) {
        triggerAnims(completion)
    }
    
    public func delay(delay:NSTimeInterval) -> Self {
        insertDelay(delay)
        return self
    }
    
    public func enableAutoDelay() -> Self {
        autoDelay = true
        return self
    }
    
    public func disableAutoDelay() -> Self {
        autoDelay = false
        return self
    }
    
    //MARK: - Tools
    func frameOfTarget() -> CGRect {
        if let validTarget = target as? UIView {
            return validTarget.frame
        }else if let validTarget = target as? CALayer {
            return validTarget.frame
        }else {
            return CGRect()
        }
    }
    
    //MARK: - Anim makers
    func animWithPropertyName(propertyName:String, toValue:AnyObject, duration:NSTimeInterval? = nil) -> POPBasicAnimation {
        let anim = POPBasicAnimation(propertyNamed: propertyName)
        anim.duration = duration ?? defaultAnimationDuration
        anim.toValue = toValue
        return anim
    }
    
    func springAnimWithPropertyName(propertyName:String, toValue:AnyObject, speed:CGFloat, bounciness:CGFloat) -> POPSpringAnimation {
        let anim = POPSpringAnimation(propertyNamed: propertyName)
        anim.toValue = toValue
        anim.springSpeed = speed
        anim.springBounciness = bounciness
        return anim
    }
    
    //MARK: - Anim tools
    func addAnims(anims:[POPAnimation], autoDelay delay:NSTimeInterval = 0) {
        var maxDuration = anims.count > 0 ? ((anims[0] as? POPBasicAnimation)?.duration ?? 0) : 0
        for anim in anims {
            anim.beginTime = CACurrentMediaTime() + delayTimeMark
            let d = (anim as? POPBasicAnimation)?.duration ?? 0
            maxDuration = maxDuration < d ? d : maxDuration
        }
        if autoDelay {
            delayTimeMark += (delay == USE_MAX_DURATION ? maxDuration : delay)
        }
        animations += anims
    }
    
    func insertDelay(delay:NSTimeInterval) {
        delayTimeMark = delayTimeMark + delay
    }
    
    func triggerAnims(completion:((POPAnimation!, Bool) -> ())?) {
        if let lastAnim = animations.last {
            lastAnim.completionBlock = completion
        }
        
        for anim in animations {
            target.pop_addAnimation(anim, forKey: nil)
        }
    }

}
