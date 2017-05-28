//
//  SignIn.swift
//  HealthCare
//
//  Created by KALSI on 3/29/17.
//  Copyright © 2017 KALSI. All rights reserved.
//

import UIKit

class SignIn: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loader: UIVisualEffectView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var forgotView: UIView!
    @IBOutlet weak var forgotEmailTF: UITextField!
    @IBOutlet weak var eye: UIImageView!
    
    var type = String()
    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- Functions -
    func SignInAction()  {
        if usernameTF.text == ""{
            Globals.attributes().TextFieldWarning(textField: usernameTF)
        }else if passwordTF.text == ""{
            Globals.attributes().TextFieldWarning(textField: passwordTF)
        }else{
            //web service
            let params = ["UserName":usernameTF.text! , "Password":passwordTF.text! , "Type":type , "FcmToken":"1234"]
            Globals.webServices().With(method: "Login", parameters: params as NSDictionary, completion: { (result) in
                print(result)
            }, failure: { (reason) in
                print(reason)
            })
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabController") as! TabController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK:- IBActions -
    @IBAction func SignIn(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            SignInAction()
            break
        case 1:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "GeneralSignUp") as! GeneralSignUp
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
    }
    @IBAction func ForgotPassword(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            //Forgot
            indicator.isHidden = true
            loader.isHidden = false
            forgotView.isHidden = false
            break
        case 2:
            //Submit
            forgotEmailTF.resignFirstResponder()
            loader.isHidden = true
            break
        case 3:
            //Close view
            forgotEmailTF.resignFirstResponder()
            loader.isHidden = true
            break
        default:
            break
        }
    }
    @IBAction func goBack(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    @IBAction func showPass(_ sender: UIButton) {
        if !sender.isSelected{
            sender.isSelected = true
            eye.image = UIImage(named: "eyeo")
            passwordTF.isSecureTextEntry = false
        }else{
            sender.isSelected = false
            eye.image = UIImage(named: "eyec")
            passwordTF.isSecureTextEntry = true
        }
    }

    
}
