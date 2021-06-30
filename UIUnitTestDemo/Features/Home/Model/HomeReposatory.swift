//
//  HomeReposatory.swift
//  UIUnitTestDemo
//
//  Created by Samira Marassy on 30/06/2021.
//

import Foundation
class HomeReposatory {
    
    func loadData(completion: @escaping ((HomeModel?) -> Void)) {
        
        let url = createURLFromParameters(parameters: [:])
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        
        request.httpMethod = "get"
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            do {
                // make sure this JSON is in the format we expect
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    // try to read out a string array
                    var homeDataArray: [String] = []
                    if let homeData = json["data"] as? [Any] {
                        for file in homeData {
                            if let dict = file as? [String: Any],
                               let titleArray = dict["title"] as? String {
                                homeDataArray.append(titleArray)
                            }
                        }
                        completion(HomeModel(homeDataArray: homeDataArray))
                    }
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        })
        
        task.resume()
    }
    
    private func createURLFromParameters(parameters: [String:Any]) -> URL {
        
        var components = URLComponents()
        components.scheme = Constants.APIHome.APIScheme
        components.host   = Constants.APIHome.APIHost
        components.path   = Constants.APIHome.APIPath
        
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
