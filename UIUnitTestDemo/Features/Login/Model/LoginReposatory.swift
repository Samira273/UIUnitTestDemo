//
//  LoginModel.swift
//  UIUnitTestDemo
//
//  Created by Samira Marassy on 28/06/2021.
//

import Foundation
class LoginReposatory {
    
    func login(with email: String, and password: String, completion: @escaping ((_ success: Bool, _ message: String?, _ loginModel: LoginModel?) -> Void)) {
        
        let url = URL(string: "https://mosaada-api-staging.ibtik.net/api/auth/login")!
        var request = URLRequest(url: url)
        let body = ["email": email, "password": password]

        // Change the URLRequest to a POST request
        request.httpMethod = "POST"
        request.httpBody = body.percentEncoded()
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            do {
                // make sure this JSON is in the format we expect
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]  else {
                    completion(false, "Login Failed", nil)
                    return
                }
                guard let data = json["data"] as? [String: Any] else {
                    completion(false, "Login Failed", nil)
                    return
                }
                completion(true, nil, LoginModel(fromDictionary: data))
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        })
        
        task.resume()
    }
    
    private func createURLFromParameters(parameters: [String:Any]) -> URL {

        var components = URLComponents()
        components.scheme = Constants.APILogin.APIScheme
        components.host   = Constants.APILogin.APIHost
        components.path   = Constants.APILogin.APIPath
        
        if !parameters.isEmpty {
            components.queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                components.queryItems!.append(queryItem)
            }
        }

        return components.url!
    }
}

struct Constants {

    struct APILogin {
        static let APIScheme = "https"
        static let APIHost = "mosaada-api-staging.ibtik.net"
        static let APIPath = "/api/auth/login"
    }
}
