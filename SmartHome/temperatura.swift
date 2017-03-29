//
//  temperatura.swift
//  SmartHome
//
//  Created by Gabriela Perez on 29/03/17.
//  Copyright © 2017 Miranda Moreno. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class Temperatura: UIViewController{
    
    // MARK: - Properties
    
    
    @IBOutlet weak var progressView: ProgressView!
    @IBOutlet weak var progressPercentageLabel: UILabel!
    @IBOutlet weak var incrementProgressButton: UIButton!
    
    let gallon = TemperaturaMax()
    
    // MARK: - View Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureProgressView()
    }
    
    // MARK: - IBActions
    
    @IBAction func incrementProgress(_ sender: UIButton) {
        
        guard progressView.curValue < CGFloat(gallon.totalOunces) else {
            return
        }
        
        // Increment progressView curValue.
        let eightOunceCup = 1
        progressView.curValue = progressView.curValue + CGFloat(eightOunceCup)
        
        // Update label based on progressView curValue.
        let percentage = (Double(progressView.curValue) / Double(gallon.totalOunces))
        progressPercentageLabel.text = numberAsPercentage(percentage)
    }
    
    @IBAction func menosProgress(_ sender: Any) {
        guard progressView.curValue < CGFloat(gallon.totalOunces) else {
            return
        }
        
        // Increment progressView curValue.
        let eightOunceCup = 1
        progressView.curValue = progressView.curValue - CGFloat(eightOunceCup)
        
        // Update label based on progressView curValue.
        let percentage = (Double(progressView.curValue) / Double(gallon.totalOunces))
        progressPercentageLabel.text = numberAsPercentage(percentage)
    }
    
    
    // MARK: - Convenience
    
    func configureProgressView() {
        progressView.curValue = CGFloat(gallon.ouncesDrank)
        progressView.range = CGFloat(gallon.totalOunces)
    }
    
    func numberAsPercentage(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.percentSymbol = ""
        return formatter.string(from: NSNumber(value: number))!
    }
    
    // MARK: - Status Bar
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

}
