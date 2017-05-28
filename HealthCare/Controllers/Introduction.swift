//
//  Introduction.swift
//  HealthCare
//
//  Created by KALSI on 3/29/17.
//  Copyright © 2017 KALSI. All rights reserved.
//

import UIKit

class Introduction: UIViewController {

    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK:-

    //MARK:- IBActions -
    @IBAction func UserTypeSelection(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignIn") as! SignIn
        switch sender.tag {
        case 0:
            vc.type = "doctor"
            break
        case 1:
            vc.type = "patient"
            break
        default:
            break
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }    
    
}
