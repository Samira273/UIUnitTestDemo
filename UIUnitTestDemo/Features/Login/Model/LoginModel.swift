//
//  LoginModel.swift
//  UIUnitTestDemo
//
//  Created by Samira Marassy on 28/06/2021.
//

import Foundation
class LoginModel: NSObject {
    func login(with email: String, and password: String, completion: @escaping ((_ success: Bool) -> Void)) {
        
        let url = URL(string: "https://mosaada-api-staging.ibtik.net/api/auth/login")!
        var request = URLRequest(url: url)
        let body = ["email": email, "password": password]
        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )

        // Change the URLRequest to a POST request
        request.httpMethod = "POST"
        request.httpBody = bodyData
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                completion(false)
            } else if let data = data {
                completion(true)
            } else {
                completion(false)
            }
        }
       
        task.resume()
    }
//    func login(with email: String, and password: String, completion: @escaping ((_ success: Bool) -> Void)) {
//
//        let url = createURLFromParameters(parameters: ["email" : email, "password": password])
//        let session = URLSession.shared
//
//        //now create the URLRequest object using the url object
//        var request = URLRequest(url: url)
//
//        request.httpMethod = "post"
//
//        //create dataTask using the session object to send data to the server
//        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
//
//            guard error == nil else {
//                return
//            }
//
//            guard let data = data else {
//                return
//            }
//
//           do {
//            //create json object from data
//            if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
//                print(json)
//                completion(true)
//            }
//           } catch let error {
//            print(error.localizedDescription)
//            completion(false)
//           }
//        })
//
//        task.resume()
//    }
    
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
