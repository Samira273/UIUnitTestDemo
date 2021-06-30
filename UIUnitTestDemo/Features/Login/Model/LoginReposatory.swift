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
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                error == nil else {                                              // check for fundamental networking error
                print("error", error ?? "Unknown error")
                completion(false, error?.localizedDescription ?? "Unknown error", nil)
                return
            }

            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                completion(false, "Network error", nil)
                return
            }
            
            do {
                guard let dataDict = (try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any])?["data"] as? [String: Any] else {
                    completion(false, "Parse error", nil)
                    return
                }
                
                completion(true, nil, LoginModel(fromDictionary: dataDict))
                
            }  catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(false, error.localizedDescription, nil)
            }
        }

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
