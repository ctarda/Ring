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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ring.progress = 0.5
        
        
    }

    @IBAction func complete(sender: AnyObject) {
        ring.progress = 1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

