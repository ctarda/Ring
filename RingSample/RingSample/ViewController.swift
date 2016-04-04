//
//  ViewController.swift
//  RingSample
//
//  Created by Cesar Tardaguila on 4/4/2016.
//  Copyright © 2016 Cesar Tardaguila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ring: Ring!

    @IBAction func complete(sender: AnyObject) {
        ring.progress = ring.progress + 0.1
    }
}

