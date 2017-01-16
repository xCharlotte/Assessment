//
//  ViewController.swift
//  BMI
//
//  Created by Charlotte Voskuilen on 23-11-16.
//  Copyright © 2016 Charlotte Voskuilen. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Makes sure you can only fill in a number in the textfield
    func convertStringToFloat(input: String) -> Float {
        
        return Float(input)!
        
    }

    @IBOutlet weak var length: UITextField!
    @IBOutlet weak var weight: UITextField!

    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func calculateBmi(_ sender: Any) {
        
        let lengteInCM = convertStringToFloat(input: length.text!)
        let gewicht = convertStringToFloat(input: weight.text!)
        
        // Makes sure you don't have to use a dot or comma while you enter your length
        let lengteInM = lengteInCM / 100
        
        // Calculates the Body Mass Index
        let BMIValue = gewicht / (lengteInM * lengteInM)
        
        // Makes sure the output has only 1 number after the comma
        let bmiString = String(format: " %.1f", BMIValue)
        
        // Returns one of these strings, depends on the output
        if BMIValue <= 18.5 {
            resultLabel.text = "Je moet aankomen. Je bmi waarde is \(bmiString)"
        }
        else if BMIValue >= 25 {
            resultLabel.text = "Je moet afvallen. Je bmi waarde is \(bmiString)"
        }
        else {
            resultLabel.text = "Je hebt een gezond gewicht. Je bmi waarde is \(bmiString)"
        }
        
    }
}

