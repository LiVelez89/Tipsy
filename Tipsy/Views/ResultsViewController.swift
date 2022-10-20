//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Lina on 29/07/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalPorPana: String?
    var summary: String?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalPorPana
        settingsLabel.text = summary
    }
    
    
    @IBAction func recalculatedPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil )//or {print("volvimos")})
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
