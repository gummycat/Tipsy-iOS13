//
//  TipBrain.swift
//  Tipsy
//
//  Created by Michael Jones on 2/19/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct TipBrain {
  func getTipPerPerson(billTotal: Float, tipPercent: Float, splitNumber: Int) -> Float {
    return round(((billTotal * (1 + tipPercent/100)) / Float(splitNumber)) * 100) / 100
  }
}
