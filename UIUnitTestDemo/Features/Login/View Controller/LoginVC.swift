//
//  ViewController.swift
//  UIUnitTestDemo
//
//  Created by Samira Marassy on 28/06/2021.
//

import UIKit

class LoginVC: UIViewController {
    
    var viewModel = LoginVM(repo: LoginReposatory()) {
        didSet {
            setupVM()
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var failureAlert: UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFailureAlert()
    }

    @IBAction func loginTapped(_ sender: Any) {
        passwordTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        viewModel.loginTapped(with: emailTextField.text, and: passwordTextField.text)
    }
    
    private func setupFailureAlert() {
        failureAlert = UIAlertController(title: "", message: "", preferredStyle: UIAlertController.Style.alert)
        failureAlert?.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    }
    
    private func setupVM() {
        viewModel.loginFailed = { message in
            self.loginFailed(with: message)
        }
        
        viewModel.loginSucceeded = {
            self.loginSuccesseded()
        }
    }
    
    func loginFailed(with message: String) {
        DispatchQueue.main.async {
            self.failureAlert?.message = message
            self.present(self.failureAlert!, animated: true, completion: nil)
            
        }
    }
    
    func loginSuccesseded() {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC, animated: true)
        }
    }
    
}

