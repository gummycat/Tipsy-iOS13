//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

  @IBOutlet weak var billTextField: UITextField!
  @IBOutlet weak var zeroPercentButton: UIButton!
  @IBOutlet weak var tenPercentButton: UIButton!
  @IBOutlet weak var twentyPercentButton: UIButton!
  @IBOutlet weak var splitNumberLabel: UILabel!

  var tipCalculator = TipBrain()
  var tipPercent = Float(10.0)
  
  @IBAction func tipChanged(_ sender: UIButton) {
    zeroPercentButton.isSelected = false
    tenPercentButton.isSelected = false
    twentyPercentButton.isSelected = false

    switch sender.tag {
    case 0:
      zeroPercentButton.isSelected = true
      tipPercent = 0.0
    case 10:
      tenPercentButton.isSelected = true
      tipPercent = 10
    case 20:
      twentyPercentButton.isSelected = true
      tipPercent = 20
    default:
      print("Houston, we have a problem")
    }
    
    resetUI()
  }
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    splitNumberLabel.text = String(Int(sender.value))
    resetUI()
  }
  
  @IBAction func calculatePressed(_ sender: Any) {
    print(billTextField.text ?? "No Value")
    
    performSegue(withIdentifier: "resultSegue", sender: self)
  }
  
  func resetUI() {
    billTextField.endEditing(true)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "resultSegue") {
      let vc = segue.destination as! ResultsViewController
      
      vc.totalBill = String(format: "%.2f", tipCalculator.getTipPerPerson(
        billTotal: Float(billTextField.text ?? "0.0") ?? 0.0,
        tipPercent: tipPercent,
        splitNumber: Int(splitNumberLabel.text ?? "1") ?? 1
      ))
      vc.settingsText = "Split between \(splitNumberLabel.text ?? "1"), with \(String(format: "%.0f", tipPercent))% tip."
      
    }
  }
}

