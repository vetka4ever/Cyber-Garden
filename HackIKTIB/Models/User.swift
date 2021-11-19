//
//  AuthSend.swift
//  HackIKTIB
//
//  Created by Daniil on 08.11.2021.
//
import Alamofire
import Foundation
import RealmSwift
struct AuthGet: Codable
{
    var user = User()
    var token: String = ""
}

// MARK: - User
struct User: Codable
{
    var id: String = ""
    var login: String = ""
    var password: String = ""
    var firstName: String = ""
    var lastName: String = ""
    
}

class AuthGetRealm: Object
{
     @objc private dynamic var classData: Data? = nil
    var data: AuthGet?{
        get
        {
            if let currentData = classData
            {
                return try? JSONDecoder().decode(AuthGet.self, from: currentData)
            }
            return nil
        }
        set
        {
            classData = try? JSONEncoder().encode(newValue)
        }
    }
    
}


