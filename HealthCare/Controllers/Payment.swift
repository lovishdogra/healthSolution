//
//  Payment.swift
//  HealthCare
//
//  Created by KALSI on 3/31/17.
//  Copyright © 2017 KALSI. All rights reserved.
//

import UIKit

class Payment: UIViewController {

    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK:-

    //MARK:- IBActions -
    @IBAction func submitAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignIn") as! SignIn
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func PaymentMethod(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            //by cash
            break
        case 2:
            //by cheque
            break
        case 3:
            //pay online
            break
        default:
            break
        }
    }
    
}
