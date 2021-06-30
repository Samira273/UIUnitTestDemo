//
//  LoginModel.swift
//  UIUnitTestDemo
//
//  Created by Samira Marassy on 30/06/2021.
//

import Foundation
struct LoginModel {
    var accessToken : String!
    var expiresIn : Int!
    var refreshToken : String!
    var tokenType : String!
    var user : User!
    
    init(fromDictionary dictionary: [String: Any]){
        accessToken = dictionary["access_token"] as? String
        expiresIn = dictionary["expires_in"] as? Int
        refreshToken = dictionary["refresh_token"] as? String
        tokenType = dictionary["token_type"] as? String
        if let userData = dictionary["user"] as? [String:Any]{
            user = User(fromDictionary: userData)
        }
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if accessToken != nil{
            dictionary["access_token"] = accessToken
        }
        if expiresIn != nil{
            dictionary["expires_in"] = expiresIn
        }
        if refreshToken != nil{
            dictionary["refresh_token"] = refreshToken
        }
        if tokenType != nil{
            dictionary["token_type"] = tokenType
        }
        if user != nil{
            dictionary["user"] = user.toDictionary()
        }
        return dictionary
    }
}

struct User{

    var acceptance : AnyObject!
    var countryCode : AnyObject!
    var email : String!
    var haveInterests : Bool!
    var id : Int!
    var isVerified : Bool!
    var name : String!
    var onBoarding : AnyObject!
    var phone : AnyObject!
    var role : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        acceptance = dictionary["acceptance"] as? AnyObject
        countryCode = dictionary["country_code"] as? AnyObject
        email = dictionary["email"] as? String
        haveInterests = dictionary["haveInterests"] as? Bool
        id = dictionary["id"] as? Int
        isVerified = dictionary["isVerified"] as? Bool
        name = dictionary["name"] as? String
        onBoarding = dictionary["onBoarding"] as? AnyObject
        phone = dictionary["phone"] as? AnyObject
        role = dictionary["role"] as? Int
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if acceptance != nil{
            dictionary["acceptance"] = acceptance
        }
        if countryCode != nil{
            dictionary["country_code"] = countryCode
        }
        if email != nil{
            dictionary["email"] = email
        }
        if haveInterests != nil{
            dictionary["haveInterests"] = haveInterests
        }
        if id != nil{
            dictionary["id"] = id
        }
        if isVerified != nil{
            dictionary["isVerified"] = isVerified
        }
        if name != nil{
            dictionary["name"] = name
        }
        if onBoarding != nil{
            dictionary["onBoarding"] = onBoarding
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        if role != nil{
            dictionary["role"] = role
        }
        return dictionary
    }

}
