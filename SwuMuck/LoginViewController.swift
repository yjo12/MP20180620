//
//  LoginViewController.swift
//  SwuMuck
//
//  Created by 연쟁 on 2018. 5. 28..
//  Copyright © 2018년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
 
        @IBOutlet var loginUserid: UITextField!
        @IBOutlet var loginPassword: UITextField!
        @IBOutlet var labelStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == self.loginUserid {
                textField.resignFirstResponder()
                self.loginPassword.becomeFirstResponder()
            }
            textField.resignFirstResponder()
            return true }
        
        @IBAction func loginPressed() {
            
            if loginUserid.text == "" {
                labelStatus.text = "학번을 입력하세요"; return; }
            if loginPassword.text == "" {
                labelStatus.text = "비밀번호를 입력하세요"; return; }
            
            //let urlString: String = "http://localhost:8888/login/loginUser.php"
            let urlString: String = "http://condi.swu.ac.kr/student/W01iphone/loginUser.php"
            
            guard let requestURL = URL(string: urlString) else {
                return }
            self.labelStatus.text = " "
            var request = URLRequest(url: requestURL)
            request.httpMethod = "POST"
            let restString: String = "&id= \(loginUserid.text!) &pwd= \(loginPassword.text!)"
                //+ loginUserid.text! + "&password=" + loginPassword.text!
            request.httpBody = restString.data(using: .utf8)
            
            //let restString: String = "&id= \(textID.text!) &password= \(textPassword.text!)  &name= \(textName.text!)"
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (responseData, response, responseError) in
                guard responseError == nil else { print("Error: calling POST")
                    return }
                guard let receivedData = responseData else { print("Error: not receiving Data")
                    return }
                do {
                    let response = response as! HTTPURLResponse
                    if !(200...299 ~= response.statusCode) {
                        print ("HTTP Error!")
                        return }
                    guard let jsonData = try JSONSerialization.jsonObject(with: receivedData, options:.allowFragments) as? [String: Any] else {
                        print("JSON Serialization Error!")
                        return }
                    
                    guard let success = jsonData["success"] as! String!
                        else { print("Error: PHP failure(success)")
                        return }
                    
                    if success == "YES" {
                        if let name = jsonData["name"] as! String! {
                            DispatchQueue.main.async {
                                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                appDelegate.userName = name
                                self.performSegue(withIdentifier: "toLoginSuccess", sender: self)
                            }
                        }
                    } else {
                        if let errMessage = jsonData["error"] as! String! { DispatchQueue.main.async {
                            self.labelStatus.text = errMessage } }
                    }
                } catch {
                    print("Error: \(error)") }
            }
            task.resume() }
    }

