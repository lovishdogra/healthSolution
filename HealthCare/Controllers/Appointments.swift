//
//  Appointments.swift
//  HealthCare
//
//  Created by KALSI on 4/16/17.
//  Copyright © 2017 KALSI. All rights reserved.
//

import UIKit

class Appointments: UIViewController {

    @IBOutlet weak var page: UIImageView!
    var type = String()
    
    //MARK:-
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if type == "fixed"{
            page.image = UIImage(named: "fixdApp")
        }else{
            page.image = UIImage(named: "prcessApp")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK:-
    
    //MARK:- IBActions -
    @IBAction func goBack(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
