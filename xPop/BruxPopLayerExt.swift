//
//  BruxPopLayerExt.swift
//  imeican
//
//  Created by BRUX on 5/18/15.
//  Copyright (c) 2015 Meican Co., Ltd. All rights reserved.
//

import UIKit

public extension CALayer {
    
    public func xPop() -> BruxLayerAndViewPopObject {
        return BruxLayerAndViewPopObject(target: self)
    }
}
