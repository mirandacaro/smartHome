//
//  Ventana.swift
//  SmartHome
//
//  Created by Gabriela Perez on 29/03/17.
//  Copyright © 2017 Miranda Moreno. All rights reserved.
//

import Foundation
import UIKit

class Ventana: UIViewController{
    
    @IBOutlet weak var imgVentanaAb: UIImageView!
    @IBOutlet weak var imgVentanaCer: UIImageView!
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        imgVentanaAb.alpha = 0
        
    }
    
    @IBAction func tapVentana(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            self.imgVentanaAb.alpha = 1
            self.imgVentanaCer.alpha = 0
        }, completion: nil)
    }
   


}
