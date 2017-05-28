//
//  Home.swift
//  HealthCare
//
//  Created by KALSI on 4/16/17.
//  Copyright © 2017 KALSI. All rights reserved.
//

import UIKit

class Home: UIViewController {

    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK:-
    
    //MARK:- IBActions -
    @IBAction func Appointments(_ sender: UIButton) {
        let vc  = self.storyboard?.instantiateViewController(withIdentifier: "Appointments") as! Appointments
        switch sender.tag {
        case 0:
            vc.type = "fixed"
            break
        case 1:
            vc.type = "inProcess"
            break
        default:
            break
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
