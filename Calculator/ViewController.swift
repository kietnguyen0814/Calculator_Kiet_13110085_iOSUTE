//
//  ViewController.swift
//  Calculator
//
//  Created by Kiet Nguyen on 4/13/17.
//  Copyright © 2017 Group9_iOSUTE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var txtTempResult: UILabel!
    @IBOutlet weak var txtSign: UILabel!
    @IBOutlet weak var txtUserInput: UILabel!
    
    var result: Double = 0
    var userInput: Double = 0
    var tempResult: Double = 0
    
    var sign = false
    var operation = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // 0 - 9 button action
    @IBAction func btnNumber(_ sender: UIButton) {
        if( sign == true){
            if( isInteger() && (txtUserInput.text == "0" || txtUserInput.text == "inf"))
            {
                txtUserInput.text = String(sender.tag)
                userInput = Double(txtUserInput.text!)!
                sign = false
                NSLog("userInput F= " + String(userInput))
                NSLog("Button Sign = " + String(sign))
            }
            else if((isInteger() && (txtUserInput.text != "0" && txtUserInput.text != "inf")) ||
                    !isInteger() && (txtUserInput.text != "0" && txtUserInput.text != "inf")){
                txtUserInput.text = "" + String(sender.tag)
                userInput = Double(txtUserInput.text!)!
                sign = false
                NSLog("userInput F= " + String(userInput))
                NSLog("Button Sign = " + String(sign))
            }
        }
        else {
            if ( isInteger() && (txtUserInput.text == "0" || txtUserInput.text == "inf")){
                txtUserInput.text = String(sender.tag)
                userInput = Double(txtUserInput.text!)!
                NSLog("Button Sign = " + String(sign))
            }
            else {
                txtUserInput.text = txtUserInput.text! + String(sender.tag)
                userInput = Double(txtUserInput.text!)!
                NSLog("Button Sign = " + String(sign))
            }
        }
        btnClear.setTitle("C", for: [.normal])
    }	
    
    // Other button action
    @IBAction func btnMath(_ sender: UIButton) {
        if (sender.tag != 10 && sender.tag != 16) {
            if(txtTempResult.text == ""){
                userInput = Double(txtUserInput.text!)!
                result = userInput
                userInput = 0
                tempResult = 0
                NSLog("userInput F= " + String(userInput))
                NSLog("tempResult F= " + String(tempResult))
            }
            NSLog("Button Sign =" + String(sign))
            if(sender.tag == 11){ // Percent button action
                    result = Double(txtUserInput.text!)! / 100
                    tempResult = result
                    txtSign.text = "%"
                    txtUserInput.text = String(result)
                    userInput = 0
                    txtTempResult.isHidden = true
            }
            else if(sender.tag == 12){ // Divide button action
                if(sign == false)
                {
                    txtTempResult.text = String(result)
                    solve()
                    tempResult = result
                    txtSign.text = "÷"
                    txtUserInput.text = String(result)
                    userInput = 0
                    NSLog("userInput F= " + String(userInput))
                    NSLog("tempResult F= " + String(tempResult))
                    NSLog("Result F= " + String(result))
                    txtTempResult.isHidden = true
                }
                else{
                    txtSign.text = "÷"
                    NSLog("userInput T= " + String(userInput))
                    NSLog("tempResult T= " + String(tempResult))
                    NSLog("Result T= " + String(result))
                    txtTempResult.isHidden = true
                }
            }
            else if(sender.tag == 13){ // Multiply button action
                if(sign == false)
                {
                    txtTempResult.text = String(result)
                    solve()
                    tempResult = result
                    txtSign.text = "×"
                    txtUserInput.text = String(result)
                    userInput = 0
                    NSLog("userInput F= " + String(userInput))
                    NSLog("tempResult F= " + String(tempResult))
                    NSLog("Result F= " + String(result))
                    txtTempResult.isHidden = true
                }
                else{
                    txtSign.text = "×"
                    NSLog("userInput T= " + String(userInput))
                    NSLog("tempResult T= " + String(tempResult))
                    NSLog("Result T= " + String(result))
                    txtTempResult.isHidden = true
                }
            }
            else if(sender.tag == 14){ // Minus button action
                if(sign == false)
                {
                    txtTempResult.text = String(result)
                    solve()
                    tempResult = result
                    txtSign.text = "−"
                    txtUserInput.text = String(result)
                    userInput = 0
                    NSLog("userInput F= " + String(userInput))
                    NSLog("tempResult F= " + String(tempResult))
                    NSLog("Result F= " + String(result))
                    txtTempResult.isHidden = true
                }
                else{
                    txtSign.text = "−"
                    NSLog("userInput T= " + String(userInput))
                    NSLog("tempResult T= " + String(tempResult))
                    NSLog("Result T= " + String(result))
                    txtTempResult.isHidden = true
                }
            }
            else if(sender.tag == 15){ // Plus button action
                if(sign == false)
                {
                    txtTempResult.text = String(result)
                    solve()
                    tempResult = result
                    txtSign.text = "+"
                    txtUserInput.text = String(result)
                    userInput = 0
                    NSLog("userInput F= " + String(userInput))
                    NSLog("tempResult F= " + String(tempResult))
                    NSLog("Result F= " + String(result))
                    txtTempResult.isHidden = true
                }
                else{
                    txtSign.text = "+"
                    NSLog("userInput T= " + String(userInput))
                    NSLog("tempResult T= " + String(tempResult))
                    NSLog("Result T= " + String(result))
                    txtTempResult.isHidden = true
                }
            }
            sign = true
            operation = sender.tag
        }
            // AC button action
        else if(sender.tag == 10){
            if (btnClear.titleLabel?.text == "C") {
                /*result = Double(txtResult.text!)! + 1
                 NSLog(String(result))*/
                userInput = 0
                txtUserInput.text = "0"
                btnClear.setTitle("AC", for: [.normal])
                NSLog("Result T= " + String(result))
            }
            else if (btnClear.titleLabel?.text == "AC"){
                userInput = 0
                result = 0
                tempResult = 0
                operation = 0
                txtUserInput.text = "0"
                txtSign.text = ""
                txtTempResult.text = ""
                sign = false
                NSLog("Result T = " + String(result))
                NSLog("Button Sign = " + String(sign))
            }
        }
            // Equal button action
        else if(sender.tag == 16){
            NSLog("Button Sign = " + String(sign))
            //Bug
            if (txtTempResult.text == "" && txtSign.text == "" && sign == true) {
                result = tempResult + userInput
                txtUserInput.text = String (result)
                txtTempResult.text = ""
                txtSign.text = ""
                result = Double(txtUserInput.text!)!
            } else if (sign == false && txtTempResult.text == "" && txtSign.text == ""){
                result = Double(txtUserInput.text!)!
            }
            NSLog("Operation = " + String(operation))
            if (operation == 11){
                txtTempResult.text = ""
                txtSign.text = ""
            } else if (operation == 12){
                result = result / userInput
                txtUserInput.text = String (result)
                sign = true
            } else if (operation == 13){
                result = result * userInput
                txtUserInput.text = String (result)
                sign = true
                /*txtUserInput.text = String (result)
                txtTempResult.text = ""
                txtSign.text = ""*/
            }else if (operation == 14){
                result = result - userInput
                txtUserInput.text = String (result)
                sign = true
            } else if (operation == 15){
                result = result + userInput
                txtUserInput.text = String (result)
                sign = true
            }
            txtUserInput.text = String (result)
            NSLog("Result = " + String(result))
        }
    }
    
    
    //Plus/Minus button action
   /* @IBAction func btnPlusMinus(_ sender: UIButton) {
        self.userInput = Double(self.txtUserInput.text!)! * -1
        self.txtUserInput.text = String(self.userInput)
    }*/
    
    
    // Solve function
    func solve(){
        if(txtSign.text == "+"){
            result = tempResult + userInput
        } else if(txtSign.text == "−")
        {
            result = tempResult - userInput
        } else if(txtSign.text == "×"){
            result = tempResult * userInput
        } else if(txtSign.text == "÷"){
            result = tempResult / userInput
        } else if(txtSign.text == "%"){
            result = Double(txtUserInput.text!)! / 100
        }
    }
    
    
    // Button "." action
    @IBAction func btnPoint(_ sender: Any) {
        if (!checkPoint()) {
            showAlert()
        }
        else{
            txtUserInput.text = txtUserInput.text! + "."
        }
        /*result = Double(txtResult.text!)!
        NSLog(String(result))*/
    }
    
    func checkPoint() -> Bool{
        var countDot : Int = 0
        for character in (txtUserInput.attributedText?.string.characters)!
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
    
    func showAlert(){
        let alert = UIAlertController(title: "Error", message: "Wrong Format!!!", preferredStyle: UIAlertControllerStyle.alert)
        //add an action
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        //show alert
        self.present(alert, animated: true, completion: nil)
    }
    
    //Check userInput is int or Double
    func isInteger() -> Bool {
        let a = Double(txtUserInput.text!)!
        let b = Int(a)
        var test = Double()
        test = a - Double(b)
        if (test == 0)
        {
            return true
        }
        else {
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
