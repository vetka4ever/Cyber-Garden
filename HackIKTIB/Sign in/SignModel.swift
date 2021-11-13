//
//  SignModel.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import Foundation
import Alamofire
import RealmSwift
import SwiftyJSON

class SignModel
{
    private let realm = try! Realm()
    private let title = "Авторизация"
    
    func getData(login: String, password: String, compilationHandler: @escaping (Bool) ->())
    {
        let url = "https://api.cybergarden.ru/auth/login"
        let parameter = AuthSend(login: login, password: password)
        var youCanEnter = false
        AF.request(url, method: .post, parameters: parameter).responseJSON
        {
            
            result in
            let data = JSON(result.data)
            
//            print(data)
            if result.response?.statusCode == 200
            {
                youCanEnter = true
                var user = AuthGet()
                user.user.firstName = data["user"]["firstName"].stringValue
                user.user.password = password
                user.user.lastName = data["user"]["lastName"].stringValue
                user.user.id = data["user"]["id"].stringValue
                user.user.login = data["user"]["login"].stringValue
                user.token = data["token"].stringValue
            
                try! self.realm.write
                {
                    let realmUser = AuthGetRealm()
                    realmUser.data = user
                    self.realm.add(realmUser)
                }
            }
            
            compilationHandler(youCanEnter)
        }
        
        
    }
    func getTitle() -> String
    {
        return title
    }
}
