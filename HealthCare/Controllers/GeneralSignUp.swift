//
//  GeneralSignUp.swift
//  HealthCare
//
//  Created by KALSI on 3/29/17.
//  Copyright © 2017 KALSI. All rights reserved.
//

import UIKit

class GeneralSignUp: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var DropDownTable: UITableView!
    @IBOutlet weak var checkMale: UIImageView!
    @IBOutlet weak var checkFemale: UIImageView!
    var type = String()
    var userTypeList = NSArray()
    
    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        DropDownTable.layer.cornerRadius = 2
        DropDownTable.layer.masksToBounds = true
        userTypeList = ["Select Type", "Clinic", "Hospital", "Diagnostic Center", "Medical Store"]
        ResetGender()
        checkMale.isHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func ResetGender()  {
        checkMale.isHidden = true
        checkFemale.isHidden = true
    }
    
    //MARK:- IBActions -
    @IBAction func goNext(_ sender: UIButton) {
        var vc = UIViewController()
        if type == "patient"{
            vc = self.storyboard?.instantiateViewController(withIdentifier: "TabController") as! TabController
        }else{
            vc = self.storyboard?.instantiateViewController(withIdentifier: "DoctorSignUp") as! DoctorSignUp
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func goBack(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    @IBAction func GenderSelection(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            ResetGender()
            checkFemale.isHidden = false
            break
        case 1:
            ResetGender()
            checkMale.isHidden = false
            break
        default:
            break
        }
    }
    
    @IBAction func DropDownAction(_ sender: Any) {
        DropDownTable.isHidden = false
    }
    
    //MARK:- UITableViewDataSource -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTypeList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = DropDownTable.dequeueReusableCell(withIdentifier: "DropCell") as? DropCell
        if (cell == nil){
            cell = DropCell(style: .default, reuseIdentifier: "DropCell")
        }
        cell?.selectionStyle = .none
        cell?.selectionLabel.text = userTypeList.object(at: indexPath.row) as? String
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        typeLabel.text = userTypeList.object(at: indexPath.row) as? String
        DropDownTable.isHidden = true
    }
    
}



