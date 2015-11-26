//
//  ViewController.swift
//  test
//
//  Created by brux on 11/26/15.
//  Copyright © 2015 Brux. All rights reserved.
//

import UIKit
import xPop

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        view.xPop().alphaTo(0, duration: 1).go()
    }
}

