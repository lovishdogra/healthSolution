//
//  DoctorSignUp.swift
//  HealthCare
//
//  Created by KALSI on 3/29/17.
//  Copyright © 2017 KALSI. All rights reserved.
//

import UIKit

class DoctorSignUp: UIViewController {
    
    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK:-

    @IBAction func goNext(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabController") as! TabController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func goBack(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
