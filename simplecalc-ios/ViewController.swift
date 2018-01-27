//
//  ViewController.swift
//  simplecalc-ios
//
//  Created by Isaac Chen on 1/26/18.
//  Copyright © 2018 Isaac Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var warning: UILabel!
    
    
    var textHolder = ""
    var calculation:[String] = []
    var operation: String = ""
    var numberOverflow = false
    func calculate(_ calc:[String]) throws -> Int{
        calc.forEach { (num) in
            if num.count > 9 {
                numberOverflow = true
            }
        }
        if numberOverflow {
            numberOverflow = false
            return 0
        }
        
        if operation == "+" {
            return Int(calculation[0])! + Int(calculation[1])!
        } else if operation == "-" {
            return Int(calculation[0])! - Int(calculation[1])!
        } else if operation == "x" {
            return Int(calculation[0])! * Int(calculation[1])!
        } else if operation == "÷" {
            return Int(calculation[0])! / Int(calculation[1])!
        } else if operation == "cnt" {
            return calculation.count
        } else if operation == "avg" {
            return calculation.reduce(0, {$0 + Int($1)!})/calculation.count
        } else if operation == "fac" {
            if Int(calculation[0])! <= 20 && Int(calculation[0])! >= 0 {
                let num = Int(calculation[0])!
                if num == 0 {
                    return 1
                }
                var returnedValue = 1
                for n in 1...num {
                    returnedValue *= n
                }
                
                return returnedValue
            }
        }
        
        return 0
    }
    
    
    @IBOutlet weak var plusBTN: UIButton!
    @IBOutlet weak var minusBTN: UIButton!
    @IBOutlet weak var multiplyBTN: UIButton!
    @IBOutlet weak var divideBTN: UIButton!

    @IBOutlet weak var countBTN: UIButton!
    @IBOutlet weak var averageBTN: UIButton!
    @IBOutlet weak var factorialBTN: UIButton!
    
    
    @IBOutlet weak var equalsBTN: UIButton!
    
    @IBOutlet weak var lab: UITextField!
    
    @IBAction func count(_ sender: Any) {
        if textHolder != "" {
            calculation.append(textHolder)
        }
        operation = "cnt"
        textHolder = ""
        lab.text = "\(lab.text ?? "something went wrong")cnt"
        plusBTN.isEnabled = false
        minusBTN.isEnabled = false
        multiplyBTN.isEnabled = false
        divideBTN.isEnabled = false
        factorialBTN.isEnabled = false
        averageBTN.isEnabled = false
        equalsBTN.isEnabled = true
    }
    
    @IBAction func average(_ sender: Any) {
        if textHolder != "" {
            calculation.append(textHolder)
        }
        operation = "avg"
        textHolder = ""
        lab.text = "\(lab.text ?? "something went wrong")avg"
        plusBTN.isEnabled = false
        minusBTN.isEnabled = false
        multiplyBTN.isEnabled = false
        divideBTN.isEnabled = false
        factorialBTN.isEnabled = false
        countBTN.isEnabled = false
        equalsBTN.isEnabled = true
    }
    
    @IBAction func factorial(_ sender: Any) {
        if textHolder != "" {
            calculation.append(textHolder)
        }
        operation = "fac"
        textHolder = ""
        lab.text = "\(lab.text ?? "something went wrong")fac"
        plusBTN.isEnabled = false
        minusBTN.isEnabled = false
        multiplyBTN.isEnabled = false
        divideBTN.isEnabled = false
        factorialBTN.isEnabled = false
        averageBTN.isEnabled = false
        countBTN.isEnabled = false
        equalsBTN.isEnabled = true
    }
    

    @IBAction func clear(_ sender: Any) {
        calculation = []
        operation = ""
        textHolder = ""
        lab.text = ""
        plusBTN.isEnabled = false
        minusBTN.isEnabled = false
        multiplyBTN.isEnabled = false
        divideBTN.isEnabled = false
        equalsBTN.isEnabled = false
        factorialBTN.isEnabled = false
        averageBTN.isEnabled = false
        countBTN.isEnabled = false
    }
    
    @IBAction func equals(_ sender: Any) {
        if textHolder != "" {
            calculation.append(textHolder)
        }
        var result:Int
        do {
            result = try calculate(calculation)
        } catch {
            result = 0
        }
        textHolder = String(result)
        lab.text = "\(result)"
        calculation = []
        operation = ""
        equalsBTN.isEnabled = false
        plusBTN.isEnabled = true
        minusBTN.isEnabled = true
        multiplyBTN.isEnabled = true
        divideBTN.isEnabled = true
        countBTN.isEnabled = true
        averageBTN.isEnabled = true
        factorialBTN.isEnabled = true
    }
    
    @IBAction func plus(_ sender: Any) {
        calculation.append(textHolder)
        operation = "+"
        textHolder = ""
        lab.text = "\(lab.text ?? "something went wrong")+"
        equalsBTN.isEnabled = false
        plusBTN.isEnabled = false
        minusBTN.isEnabled = false
        multiplyBTN.isEnabled = false
        divideBTN.isEnabled = false
        factorialBTN.isEnabled = false
        averageBTN.isEnabled = false
        countBTN.isEnabled = false
    }
    
    @IBAction func minus(_ sender: Any) {
        calculation.append(textHolder)
        operation = "-"
        textHolder = ""
        lab.text = "\(lab.text ?? "something went wrong")-"
        equalsBTN.isEnabled = false
        plusBTN.isEnabled = false
        minusBTN.isEnabled = false
        multiplyBTN.isEnabled = false
        divideBTN.isEnabled = false
        factorialBTN.isEnabled = false
        averageBTN.isEnabled = false
        countBTN.isEnabled = false
    }
    
    @IBAction func multiply(_ sender: Any) {
        calculation.append(textHolder)
        operation = "x"
        textHolder = ""
        lab.text = "\(lab.text ?? "something went wrong")x"
        equalsBTN.isEnabled = false
        plusBTN.isEnabled = false
        minusBTN.isEnabled = false
        multiplyBTN.isEnabled = false
        divideBTN.isEnabled = false
        factorialBTN.isEnabled = false
        averageBTN.isEnabled = false
        countBTN.isEnabled = false
    }
    
    @IBAction func divide(_ sender: Any) {
        calculation.append(textHolder)
        operation = "÷"
        textHolder = ""
        lab.text = "\(lab.text ?? "something went wrong")÷"
        equalsBTN.isEnabled = false
        plusBTN.isEnabled = false
        minusBTN.isEnabled = false
        multiplyBTN.isEnabled = false
        divideBTN.isEnabled = false
        factorialBTN.isEnabled = false
        averageBTN.isEnabled = false
        countBTN.isEnabled = false
    }
    
    @IBAction func one(_ sender: Any) {
        textHolder = "\(textHolder)1"
        lab.text = "\(lab.text ?? "something went wrong")1"
        if operation == "" {
            plusBTN.isEnabled = true
            minusBTN.isEnabled = true
            multiplyBTN.isEnabled = true
            divideBTN.isEnabled = true
            factorialBTN.isEnabled = true
            averageBTN.isEnabled = true
            countBTN.isEnabled = true
        }
        equalsBTN.isEnabled = true

    }
    
    @IBAction func two(_ sender: Any) {
        textHolder = "\(textHolder)2"
        lab.text = "\(lab.text ?? "something went wrong")2"
        if operation == "" {
            plusBTN.isEnabled = true
            minusBTN.isEnabled = true
            multiplyBTN.isEnabled = true
            divideBTN.isEnabled = true
            factorialBTN.isEnabled = true
            averageBTN.isEnabled = true
            countBTN.isEnabled = true
        }
        equalsBTN.isEnabled = true
    }
    
    @IBAction func three(_ sender: Any) {
        textHolder = "\(textHolder)3"
        lab.text = "\(lab.text ?? "something went wrong")3"
        if operation == "" {
            plusBTN.isEnabled = true
            minusBTN.isEnabled = true
            multiplyBTN.isEnabled = true
            divideBTN.isEnabled = true
            factorialBTN.isEnabled = true
            averageBTN.isEnabled = true
            countBTN.isEnabled = true
        }
        equalsBTN.isEnabled = true
    }
    
    @IBAction func four(_ sender: Any) {
        textHolder = "\(textHolder)4"
        lab.text = "\(lab.text ?? "something went wrong")4"
        if operation == "" {
            plusBTN.isEnabled = true
            minusBTN.isEnabled = true
            multiplyBTN.isEnabled = true
            divideBTN.isEnabled = true
            factorialBTN.isEnabled = true
            averageBTN.isEnabled = true
            countBTN.isEnabled = true
        }
        equalsBTN.isEnabled = true
    }
    
    @IBAction func five(_ sender: Any) {
        textHolder = "\(textHolder)5"
        lab.text = "\(lab.text ?? "something went wrong")5"
        if operation == "" {
            plusBTN.isEnabled = true
            minusBTN.isEnabled = true
            multiplyBTN.isEnabled = true
            divideBTN.isEnabled = true
            factorialBTN.isEnabled = true
            averageBTN.isEnabled = true
            countBTN.isEnabled = true
        }
        equalsBTN.isEnabled = true
    }
    
    @IBAction func six(_ sender: Any) {
        textHolder = "\(textHolder)6"
        lab.text = "\(lab.text ?? "something went wrong")6"
        if operation == "" {
            plusBTN.isEnabled = true
            minusBTN.isEnabled = true
            multiplyBTN.isEnabled = true
            divideBTN.isEnabled = true
            factorialBTN.isEnabled = true
            averageBTN.isEnabled = true
            countBTN.isEnabled = true
        }
        equalsBTN.isEnabled = true
    }
    
    @IBAction func seven(_ sender: Any) {
        textHolder = "\(textHolder)7"
        lab.text = "\(lab.text ?? "something went wrong")7"
        if operation == "" {
            plusBTN.isEnabled = true
            minusBTN.isEnabled = true
            multiplyBTN.isEnabled = true
            divideBTN.isEnabled = true
            factorialBTN.isEnabled = true
            averageBTN.isEnabled = true
            countBTN.isEnabled = true
        }
        equalsBTN.isEnabled = true
    }
    
    @IBAction func eight(_ sender: Any) {
        textHolder = "\(textHolder)8"
        lab.text = "\(lab.text ?? "something went wrong")8"
        if operation == "" {
            plusBTN.isEnabled = true
            minusBTN.isEnabled = true
            multiplyBTN.isEnabled = true
            divideBTN.isEnabled = true
            factorialBTN.isEnabled = true
            averageBTN.isEnabled = true
            countBTN.isEnabled = true
        }
        equalsBTN.isEnabled = true
    }
    
    @IBAction func nine(_ sender: Any) {
        textHolder = "\(textHolder)9"
        lab.text = "\(lab.text ?? "something went wrong")9"
        if operation == "" {
            plusBTN.isEnabled = true
            minusBTN.isEnabled = true
            multiplyBTN.isEnabled = true
            divideBTN.isEnabled = true
            factorialBTN.isEnabled = true
            averageBTN.isEnabled = true
            countBTN.isEnabled = true
        }
        equalsBTN.isEnabled = true
    }
    
    @IBAction func zero(_ sender: Any) {
        textHolder = "\(textHolder)0"
        lab.text = "\(lab.text ?? "something went wrong")0"
        if operation == "" {
            plusBTN.isEnabled = true
            minusBTN.isEnabled = true
            multiplyBTN.isEnabled = true
            divideBTN.isEnabled = true
            factorialBTN.isEnabled = true
            averageBTN.isEnabled = true
            countBTN.isEnabled = true
        }
        equalsBTN.isEnabled = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

