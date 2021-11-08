//
//  SignModel.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class SignModel
{
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
            if data["user"].isEmpty == false
            {
                youCanEnter = true
                
            }
            compilationHandler(youCanEnter)
        }
        
        
    }
    func getTitle() -> String
    {
        return title
    }
}
