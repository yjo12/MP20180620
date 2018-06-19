//
//  ViewController.swift
//  Swumuck_owner_ver
//
//  Created by 연쟁 on 2018. 5. 28..
//  Copyright © 2018년 연쟁. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var loginOwnerid: UITextField!
    @IBOutlet var loginPassword: UITextField!
    @IBOutlet var labelStatus: UILabel!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var joinButton: UIButton!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.loginOwnerid {
        textField.resignFirstResponder()
        self.loginPassword.becomeFirstResponder() }
        textField.resignFirstResponder()
        return true }
    
    @IBAction func loginPressed() {
  
        if loginOwnerid.text == "" {
            labelStatus.text = "ID를 입력하세요"; return; }
        if loginPassword.text == "" {
            labelStatus.text = "비밀번호를 입력하세요"; return; }
        let urlString: String = "http://localhost:8888/login/loginOwner.php"
        guard let requestURL = URL(string: urlString) else {
            return }
        self.labelStatus.text = " "
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        let restString: String = "id=" + loginOwnerid.text! + "&password=" + loginPassword.text!
        request.httpBody = restString.data(using: .utf8)
    
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (responseData, response, responseError) in guard responseError == nil else {
                print("Error: calling POST")
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
               
                
                
                guard let success = jsonData["success"] as! String! else { print("Error: PHP failure(success)")
                    return }
                if success == "YES" {
                        DispatchQueue.main.async {
                          self.performSegue(withIdentifier: "toLoginSuccess", sender: self) }
                    }
                else {
                    if let errMessage = jsonData["error"] as! String! { DispatchQueue.main.async {
                        self.labelStatus.text = errMessage } }
                }
            } catch {
                print("Error: \(error)") }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 15.0
        joinButton.layer.cornerRadius = 15.0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

