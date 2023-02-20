//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Michael Jones on 2/19/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
  
  var totalBill: String?
  var settingsText: String?
  
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var settingsLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    totalLabel.text = totalBill
    settingsLabel.text = settingsText    
  }
  
  @IBAction func recalculatePressed(_ sender: UIButton) {
    dismiss(animated: true)
  }
}
