//
//  BruxLayoutConstraintPopObject.swift
//  imeican
//
//  Created by BRUX on 11/23/15.
//  Copyright © 2015 Meican Co., Ltd. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {
    
    public func xPop() -> BruxLayoutConstraintPopObject {
        return BruxLayoutConstraintPopObject(target: self)
    }
}

public class BruxLayoutConstraintPopObject: BruxPopObject {

    override init(target:NSObject) {
        super.init(target: target)
    }
    
    public func springValueTo(value:CGFloat, speed:CGFloat = 20, bounciness:CGFloat = 15) -> Self {
        let anim = springAnimWithPropertyName(kPOPLayoutConstraintConstant, toValue: value, speed: speed, bounciness: bounciness)
        addAnims([anim])
        return self
    }
    
    public func valueTo(value:CGFloat, duration:NSTimeInterval? = nil) -> Self {
        let anim = animWithPropertyName(kPOPLayoutConstraintConstant, toValue: value, duration: duration)
        addAnims([anim])
        return self
    }

}
