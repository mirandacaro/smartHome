//
//  Luces.swift
//  SmartHome
//
//  Created by Gabriela Perez on 28/03/17.
//  Copyright © 2017 Miranda Moreno. All rights reserved.
//

import Foundation
import UIKit

class Luces: UIViewController {
    @IBOutlet weak var focoPrendido: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
        
        focoPrendido.alpha = 0
        
    }
    
    @IBAction func TapFocoApagado(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.focoPrendido.alpha = 1
        }, completion: nil)
    }
    

}


