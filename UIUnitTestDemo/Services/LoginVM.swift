//
//  LoginVM.swift
//  UIUnitTestDemo
//
//  Created by Samira Marassy on 28/06/2021.
//

import Foundation

class LoginVM: NSObject {
    
    var loginFailed: ((String) -> Void)?
    var loginSucceeded: (() -> Void)?
    private var repo: LoginReposatory
    
    init(repo: LoginReposatory) {
        self.repo = repo
    }
    
    func loginTapped(with email: String?, and password: String?) {
        if !validateEmailAndPassword(email, password) {
            loginFailed?("Invalid email or password")
        } else {
            // network call
            repo.login(with: email!, and: password!, completion: { success, message, loginModel  in
                if success && loginModel != nil {
                    self.loginSucceeded?()
                } else {
                    self.loginFailed?("Login failed")
                }
            })
        }
    }
    
    private func validateEmailAndPassword(_ email: String?, _ password: String?) -> Bool {
        guard let email = email, let password = password else {
            return false
        }
        if password.count > 8 {
            return false
        } else if password.isEmpty {
            return false
        } else {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
    }
}
