//
//  ViewController.swift
//  Calculator
//
//  Created by Kiet Nguyen on 4/13/17.
//  Copyright © 2017 Group9_iOSUTE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 0 -> 9 button action
    
    @IBAction func btnNumber(_ sender: UIButton) {
        txtNumber.text = txtNumber.text! + String(sender.tag-1)
    }
}

