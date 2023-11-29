//
//  DetalisColor.swift
//  ColorApp
//
//  Created by Fatima Zahra SEDKI on 22/5/2023.
//

import UIKit

class DetalisColor: UIViewController {
     
    var color : UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()

    // recieve the data
         view.backgroundColor = color ?? .darkGray
        
    }
    

   

}
