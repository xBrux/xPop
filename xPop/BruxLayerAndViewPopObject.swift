//
//  BruxLayerAndViewPopObject.swift
//  imeican
//
//  Created by BRUX on 11/23/15.
//  Copyright © 2015 Meican Co., Ltd. All rights reserved.
//

import UIKit

public class BruxLayerAndViewPopObject: BruxPopObject {
    
//    private let target:NSObject
    
    override init(target:NSObject) {
        super.init(target: target)
    }

    //MARK: - Basic Animations
    public func frameTo(frame:CGRect,  duration:NSTimeInterval? = nil) -> Self {
        let anim = animWithPropertyName(kPOPViewFrame, toValue: NSValue(CGRect: frame), duration: duration)
        addAnims([anim])
        return self
    }
    
    public func alphaTo(alpha:CGFloat, duration:NSTimeInterval? = nil) -> Self {
        if target is UIView {
            let anim = animWithPropertyName(kPOPViewAlpha, toValue: alpha, duration: duration)
            addAnims([anim], autoDelay: anim.duration)
        }
        return self
    }
    
    public func scaleXYTo(scale:CGPoint, duration:NSTimeInterval? = nil) -> Self {
        let propertyName = target is UIView ? kPOPViewScaleXY : kPOPLayerScaleXY
        let anim = animWithPropertyName(propertyName, toValue: NSValue(CGPoint: scale), duration: duration)
        addAnims([anim], autoDelay: anim.duration)
        return self
    }
    public func originTo(point:CGPoint, duration:NSTimeInterval? = nil) -> Self {
        let anim = animWithPropertyName(kPOPViewFrame, toValue: NSValue(CGRect: CGRect(origin: point, size: frameOfTarget().size)), duration: duration)
        addAnims([anim], autoDelay: anim.duration)
        return self
    }
    
    public func sizeTo(size:CGSize, duration:NSTimeInterval? = nil) -> Self {
        let anim = animWithPropertyName(kPOPViewFrame, toValue: NSValue(CGRect: CGRect(origin: frameOfTarget().origin, size: size)), duration: duration)
        addAnims([anim], autoDelay: anim.duration)
        return self
    }
    
    public func moveUp(offset:CGFloat, duration:NSTimeInterval? = nil) -> Self {
        let anim = animWithPropertyName(kPOPViewFrame, toValue: NSValue(CGRect: CGRect(origin: CGPoint(x: frameOfTarget().origin.x, y: frameOfTarget().origin.y - offset), size: frameOfTarget().size)), duration: duration)
        addAnims([anim], autoDelay: anim.duration)
        return self
    }
    
    public func moveDown(offset:CGFloat, duration:NSTimeInterval? = nil) -> Self {
        let anim = animWithPropertyName(kPOPViewFrame, toValue: NSValue(CGRect: CGRect(origin: CGPoint(x: frameOfTarget().origin.x, y: frameOfTarget().origin.y + offset), size: frameOfTarget().size)), duration: duration)
        addAnims([anim], autoDelay: anim.duration)
        return self
    }
    
    public func moveLeft(offset:CGFloat, duration:NSTimeInterval? = nil) -> Self {
        let anim = animWithPropertyName(kPOPViewFrame, toValue: NSValue(CGRect: CGRect(origin: CGPoint(x: frameOfTarget().origin.x - offset, y: frameOfTarget().origin.y), size: frameOfTarget().size)), duration: duration)
        addAnims([anim], autoDelay: anim.duration)
        return self
    }
    
    public func moveRight(offset:CGFloat, duration:NSTimeInterval? = nil) -> Self {
        let anim = animWithPropertyName(kPOPViewFrame, toValue: NSValue(CGRect: CGRect(origin: CGPoint(x: frameOfTarget().origin.x + offset, y: frameOfTarget().origin.y), size: frameOfTarget().size)), duration: duration)
        addAnims([anim], autoDelay: anim.duration)
        return self
    }
    
    public func rotate(radian:CGFloat, duration:NSTimeInterval? = nil) -> Self {
        guard target is CALayer else {return self }
        let anim = animWithPropertyName(kPOPLayerRotation, toValue: radian, duration: duration)
        addAnims([anim], autoDelay: anim.duration)
        return self
    }
    
    //MARK: - Spring Animations
    public func springOriginTo(point:CGPoint, speed:CGFloat = 20, bounciness:CGFloat = 15) -> Self {
        let anim = springAnimWithPropertyName(kPOPViewFrame, toValue: NSValue(CGRect: CGRect(origin: point, size: frameOfTarget().size)), speed: speed, bounciness: bounciness)
        addAnims([anim])
        return self
    }
    
    public func springSizeTo(size:CGSize, speed:CGFloat = 20, bounciness:CGFloat = 15) -> Self {
        let anim = springAnimWithPropertyName(kPOPViewFrame, toValue: NSValue(CGRect: CGRect(origin: frameOfTarget().origin, size: size)), speed: speed, bounciness: bounciness)
        addAnims([anim])
        return self
    }
    
    public func springFrameTo(frame:CGRect, speed:CGFloat = 20, bounciness:CGFloat = 15) -> Self {
        let anim = springAnimWithPropertyName(kPOPViewFrame, toValue: NSValue(CGRect: frame), speed: speed, bounciness: bounciness)
        addAnims([anim])
        return self
    }
    
    public func springScaleXYTo(scale:CGPoint, speed:CGFloat = 20, bounciness:CGFloat = 15) -> Self {
        let propertyName = target is UIView ? kPOPViewScaleXY : kPOPLayerScaleXY
        let anim = springAnimWithPropertyName(propertyName, toValue: NSValue(CGPoint: scale), speed: speed, bounciness: bounciness)
        addAnims([anim])
        return self
    }
    
    public func springMoveUp(offset:CGFloat, speed:CGFloat = 20, bounciness:CGFloat = 15) -> Self {
        let anim = springAnimWithPropertyName(kPOPViewFrame, toValue: NSValue(CGRect: CGRect(origin: CGPoint(x: frameOfTarget().origin.x, y: frameOfTarget().origin.y - offset), size: frameOfTarget().size)), speed: speed, bounciness: bounciness)
        addAnims([anim])
        return self
    }
    
    public func springMoveDown(offset:CGFloat, speed:CGFloat = 20, bounciness:CGFloat = 15) -> Self {
        let anim = springAnimWithPropertyName(kPOPViewFrame, toValue: NSValue(CGRect: CGRect(origin: CGPoint(x: frameOfTarget().origin.x, y: frameOfTarget().origin.y + offset), size: frameOfTarget().size)), speed: speed, bounciness: bounciness)
        addAnims([anim])
        return self
    }
    
    public func springMoveLeft(offset:CGFloat, speed:CGFloat = 20, bounciness:CGFloat = 15) -> Self {
        let anim = springAnimWithPropertyName(kPOPViewFrame, toValue: NSValue(CGRect: CGRect(origin: CGPoint(x: frameOfTarget().origin.x - offset, y: frameOfTarget().origin.y), size: frameOfTarget().size)), speed: speed, bounciness: bounciness)
        addAnims([anim])
        return self
    }
    
    public func springMoveRight(offset:CGFloat, speed:CGFloat = 20, bounciness:CGFloat = 15) -> Self {
        let anim = springAnimWithPropertyName(kPOPViewFrame, toValue: NSValue(CGRect: CGRect(origin: CGPoint(x: frameOfTarget().origin.x + offset, y: frameOfTarget().origin.y), size: frameOfTarget().size)), speed: speed, bounciness: bounciness)
        addAnims([anim])
        
        return self
    }
    
    public func opacityTo(opacity:Float, duration:NSTimeInterval? = nil) -> Self {
        if target is CALayer {
            let anim = animWithPropertyName(kPOPLayerOpacity, toValue: opacity, duration: duration)
            addAnims([anim], autoDelay: anim.duration)
        }
        return self
    }

}
