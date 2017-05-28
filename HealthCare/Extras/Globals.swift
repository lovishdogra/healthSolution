//
//  Globals.swift
//  HealthCare
//
//  Created by KALSI on 4/22/17.
//  Copyright © 2017 KALSI. All rights reserved.
//

import UIKit

let kBaseUrl = "http://52.66.13.38:8080/api/SignUp/"

class Globals: NSObject {
    
    //Email validation
    func isValidEmail(testStr:String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    struct animations {
        func fadeIn(view:UIView) {
            UIView.animate(withDuration: 0.3) {
                view.alpha = 1
            }
        }
        func fadeOut(view:UIView) {
            UIView.animate(withDuration: 0.3) {
                view.alpha = 0
            }
        }
    }
    
    struct attributes {
        func roundOffCorners(view : UIView){
            view.layer.cornerRadius = view.frame.size.height / 2
            view.layer.masksToBounds = true
        }
        
        func TextFieldWarning(textField : UITextField) {
            var index = ((textField.placeholder)?.components(separatedBy: " ").count)! - 1
            if index == -1{
                index = 0
            }
            if (textField.placeholder)?.components(separatedBy: " ")[index] != "required"{
                let placeholderText = "\(textField.placeholder!) required"
                let str : NSAttributedString = NSAttributedString(string: placeholderText, attributes: [NSForegroundColorAttributeName:UIColor.red]);
                textField.attributedPlaceholder = str
            }
            textField.becomeFirstResponder()
        }
    }
    
    struct webServices {
    
        func With(method : String, parameters : NSDictionary, completion: @escaping (_ result : NSDictionary) -> (), failure: @escaping (_ fail : AnyObject) -> ())  {
//            let param = ["FcmToken":"12345", "UserName":"test@gmail.com","Password":"c!9QYs$","Type":"doctor"]
            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            let url: URL = URL(string: "\(kBaseUrl)\(method)")!
            var request: URLRequest = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
                
                print(response!)
                print(error ?? "no error")
                print(data ?? "data nil")
                
                if data != nil {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary{
                            print(json)
                            completion(json)
                        }else{
                            failure(response!)
                        }
                    } catch let error as NSError {
                        print(" eror : \(error)")
                        failure(error)
                    }
                } else {
                    print("no data")
                    failure(response!)
                }
            })
            task.resume()
        }
    }

}
