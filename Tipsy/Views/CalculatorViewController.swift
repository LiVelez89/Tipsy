//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var viewModel: CalculatorViewModel!
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CalculatorViewModel(TipsyModel(bill: 0.0, tip: 0.1, people: 2))
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        viewModel.getBillPercentage(buttonTitle: (sender.titleLabel?.text)!)
        
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        viewModel.getPeople(amount: sender.value)
        splitNumberLabel.text = viewModel.getPeopleLabel()
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        viewModel.tipsy.bill = Double(billTextField.text ?? "0") ?? 0.0
        performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalPorPana = viewModel.getTotalPorPana()
            let resultTip = viewModel.getResultTip()
            destinationVC.summary = "Split between \(viewModel.tipsy.people) with a \(resultTip)% tip."
        }
    }
}
