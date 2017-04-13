//
//  ViewController.swift
//  Calculator
//
//  Created by Kiet Nguyen on 4/13/17.
//  Copyright © 2017 Group9_iOSUTE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtTempNumber: UILabel!
    @IBOutlet weak var txtSign: UILabel!
    @IBOutlet weak var txtResult: UILabel!
    
    var result: Double = 0
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
        if (txtResult.text == "0"){
            txtResult.text = String(sender.tag)
        }
        else{
            txtResult.text = txtResult.text! + String(sender.tag)
        }
    }
    
    // other button action
    
    @IBAction func btnMath(_ sender: UIButton) {
    }
    
    
    
    // Button "." action
    @IBAction func btnPoint(_ sender: Any) {
        if (!checkPoint()) {
            let alert = UIAlertController(title: "Error", message: "Wrong Format!!!", preferredStyle: UIAlertControllerStyle.alert);
            //add an action
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            //show alert
            self.present(alert, animated: true, completion: nil);
        }
        else{
            txtResult.text = txtResult.text! + "."
        }
        /*result = Double(txtResult.text!)!
        NSLog(String(result))*/
    }
    
    func checkPoint() -> Bool{
        var countDot : Int = 0
        for character in (txtResult.attributedText?.string.characters)!
        {
            if(character == ".")
            {
                countDot += 1
            }
        }
        if (countDot == 0){
            return true
        }
        else{
            return false
        }
    }
    
   /* func checkCharacter(character: String) -> Bool {
        var countDot : Int = 0
        for character in (txtResult.attributedText?.string.characters)!
        {
            if(character == ".")
            {
                countDot += 1
            }
        }
        if (countDot > 1) {
            return false
        }
        else{
            return true
        }
        return true
    }*/
}
