//
//  EmailSignUpVC.swift
//  FlowClu
//
//  Created by Harman Gill on 2019-06-07.
//  Copyright © 2019 Harman Gill. All rights reserved.
//

import UIKit
import Firebase

class EmailSignUpVC: UIViewController, UITextFieldDelegate  {

//    @IBOutlet var viewGradient: UIView!
//    let color1 = UIColor(red: 48.0/255.0, green: 178.0/255.0, blue: 166.0/255.0, alpha: 1.0)
//    let color2 = UIColor(red: 82.0/255.0, green: 96.0/255.0, blue: 169.0/255.0, alpha: 1.0)
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordsUnmatchLabel: UILabel!
    var activityView:UIActivityIndicatorView!
    var continueButton : RoundedWhiteButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
          view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
//      
        
        continueButton = RoundedWhiteButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        continueButton.setTitleColor(secondaryColor, for: .normal)
        continueButton.setTitle("SIGN UP", for: .normal)
        continueButton.titleLabel?.font = UIFont.systemFont(ofSize: 18.0, weight: UIFont.Weight.bold)
        continueButton.center = CGPoint(x: view.center.x, y: view.frame.height - continueButton.frame.height - 24)
        continueButton.highlightedColor = UIColor(white: 1.0, alpha: 1.0)
        continueButton.defaultColor = UIColor.white
        continueButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)

        view.addSubview(continueButton)
        setContinueButton(enabled: false)
        
        activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityView.color = secondaryColor
        activityView.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        activityView.center = continueButton.center
        
        view.addSubview(activityView)
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
           confirmPasswordTextField.delegate = self
        
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
         confirmPasswordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameTextField.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillAppear), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
        
        NotificationCenter.default.removeObserver(self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }
    
    @objc func keyboardWillAppear(notification: NSNotification){
        
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        continueButton.center = CGPoint(x: view.center.x,
                                        y: view.frame.height - keyboardFrame.height - 16.0 - continueButton.frame.height / 2)
        activityView.center = continueButton.center
    }
    
    
    @objc func textFieldChanged(_ target:UITextField) {
        let username = nameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        
        let formFilled = username != nil && username != "" && email != nil && email != "" && password != nil && password != "" && confirmPassword != nil && confirmPassword != "" && password == confirmPassword
        setContinueButton(enabled: formFilled)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Resigns the target textField and assigns the next textField in the form.
        
        switch textField {
        case nameTextField:
            nameTextField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
            break
        case emailTextField:
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            break
        case passwordTextField:
            passwordTextField.resignFirstResponder()
            confirmPasswordTextField.becomeFirstResponder()
           break
            case confirmPasswordTextField:
            handleSignUp()
            break
        default:
            break
        }
        return true
    }
    
    
    func setContinueButton(enabled:Bool) {
        if enabled {
            continueButton.alpha = 1.0
            continueButton.isEnabled = true
        } else {
            continueButton.alpha = 0.5
            continueButton.isEnabled = false
        }
    }
    
    @objc func handleSignUp() {
        guard let username = nameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        
        setContinueButton(enabled: false)
        continueButton.setTitle("", for: .normal)
        activityView.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                print("User created!")
               
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print("User display name changed!")
                  
                        self.dismiss(animated: false, completion: nil)
                    } else {
                        
                        if let errCode = AuthErrorCode(rawValue: error!._code) {
                            
                            switch errCode {
                            case .emailAlreadyInUse:
                                print(" This email is already in use", ".....................................................")
                                
                                let alert = UIAlertController(title:preferredStyle: .Alert)
                                
                                
                                let alert = UIAlertController(title: "عذرًا", message:"خطأ في الاتصال بالانترنت", preferredStyle: .Alert)
                                alert.addAction(UIAlertAction(title: "نعم", style: .Default) { _ in })
                                self.presentViewController(alert, animated: true){}
                            default:
                                print("Create User Error: \(error)")
                            }
                        }
                        print("Error: \(error!.localizedDescription)")
                        
                    }
                }
                
            } else {
                print("Error: \(error!.localizedDescription)")
            }
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
