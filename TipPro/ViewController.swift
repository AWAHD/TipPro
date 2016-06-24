//
//  ViewController.swift
//  TipPro
//
//  Created by Andy Wong on 6/22/16.
//  Copyright © 2016 Andy Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate { //adding UITextFieldDelegate allows the keyboard to show up when textField is tapped
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipSelectorSegmentControl: UISegmentedControl!
    @IBOutlet weak var tipAmountTextField: UITextField!
    @IBOutlet weak var totalAmountTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billAmountTextField.delegate = self //The delegate for this control is the view controller itself. When this objet needs to make an action, it will do the action 
        //delegate is the connection
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle{
        return .LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func calculateTip(sender: AnyObject) { //Function will calculate tip and AnyObject is the parameter
        guard let billAmount = Double(billAmountTextField.text!)
            else { //if what user types in text field cannot be convertedto a type double, thit will automatically become a empty space
            billAmountTextField.text = ""
            tipAmountTextField.text = ""
            totalAmountTextField.text = ""
            return
        }
        var tipPercentage = 0.0 //sets tip percentage to 0 so when using seletor it will change the percentage then 
        
        switch tipSelectorSegmentControl.selectedSegmentIndex { //switch allows us to make a few cases where when use selected a case, it will run that case
        case 0: tipPercentage = 0.15
        case 1: tipPercentage = 0.18
        case 2:tipPercentage = 0.20
        default: //thsi is the default caee, this is what it will do when it doesn't go to eitehr case
            break
        }
    
        let roundedBillAmount  = round(100*billAmount)/100 //roubles the bill amount
        let tipAmount = roundedBillAmount * tipPercentage //multiplies tip percentage with the roundedbill amount to bring tip percentage
        let roundedTipAmount = round (100 * tipAmount)/100 //rounds the tip amount
        let totalAmount = roundedBillAmount + roundedTipAmount // adds the rounded bill and tip amount to bring you a total
   
        if (!billAmountTextField.editing) { //edits billAmountField
            billAmountTextField.text = String(format: "%,2f", roundedBillAmount)
        }//edits the billAMountField to the roundedTipAmount
        tipAmountTextField.text = String(format: "%2.f", tipAmount)
        totalAmountTextField.text = String(format: "%2.f", totalAmount) //edits the totalAmountField to what total amount is
        
        //MAKE SURE THIS IS WHAT HTE IF stateemtn does. Figure out what ".editing" does
        
    }
}