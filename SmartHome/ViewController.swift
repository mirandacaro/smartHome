//
//  ViewController.swift
//  SmartHome
//
//  Created by Gabriela Perez on 28/03/17.
//  Copyright © 2017 Miranda Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func tapLuces(_ sender: Any) {
        
        performSegue(withIdentifier: "goToLuces", sender: self)
    }

    @IBAction func tapVentanas(_ sender: Any) {
        performSegue(withIdentifier: "goToVentanas", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func deRegreso(segue:UIStoryboardSegue!){
    
    }
}

