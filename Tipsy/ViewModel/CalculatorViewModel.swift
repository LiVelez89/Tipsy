//
//  CalculatorViewModel.swift
//  Tipsy
//
//  Created by Lina on 1/08/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

class CalculatorViewModel {
    /// ViewModel 
    var tipsy: TipsyModel!
    
    init (_ model: TipsyModel) {
        self.tipsy = model
    }
    
    func getBillPercentage(buttonTitle: String) {
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        tipsy.tip = Double(buttonTitleMinusPercentSign)! / 100.0
    }
    
    func getPeople(amount: Double) {
        tipsy.people = Int(amount)
    }
    
    func getPeopleLabel() -> String {
        return String(tipsy.people)
    }
    
    func getTotalPorPana() -> String {
        let totalPorPana = (tipsy.bill * (tipsy.tip + 1)) / Double(tipsy.people)
        return String(format: "%.2f", totalPorPana)
        
    }
    func getResultTip() -> Int {
        return Int (tipsy.tip * 100)
    }
}
