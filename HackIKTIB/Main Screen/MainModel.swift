//
//  MainModel.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//
import RealmSwift
import Alamofire
import SwiftyJSON
import Foundation
class MaindModel
{
    
    private let title = "Проекты"
    
    private let realm = try! Realm()
    private var projects = [String:Case]()
    private var namesOfProjects = [String]()
    private let user : Results<AuthGetRealm> =
    {
        let user = (try! Realm()).objects(AuthGetRealm.self)
        return user
    }()
  
    init()
    {
        updateToken{}
    }
    private func updateToken(compilationHandler: @escaping ()->())
    {
        let url = "https://api.cybergarden.ru/auth/login"
        let parameter = AuthSend(login: user[0].data!.user.login, password: user[0].data!.user.password)
        AF.request(url, method: .post, parameters: parameter).responseJSON
        {
            result in
            let data = JSON(result.data)
            
            if result.response?.statusCode == 200
            {
                
                var currentUser = AuthGet()
                currentUser.user.firstName = data["user"]["firstName"].stringValue
                currentUser.user.lastName = data["user"]["lastName"].stringValue
                currentUser.user.id = data["user"]["id"].stringValue
                currentUser.user.login = data["user"]["login"].stringValue
                currentUser.user.password = self.user[0].data!.user.password
                currentUser.token = data["token"].stringValue
                
                try! self.realm.write
                {
                    self.user[0].data = currentUser
                }
            }
            compilationHandler()
            
        }
    }
    
    
         func getNameOfJury() -> String
        {
            var name = ""
            guard let mayBeFirstName = user[0].data?.user.firstName else {return name}
            guard let mayBeLastName = user[0].data?.user.lastName else {return name}
            name = mayBeFirstName + " " + mayBeLastName
            return name
        }
    func loadProjects(compilationHandler: @escaping ()->())
    {
        let url = "https://api.cybergarden.ru/cases"
        
        let headers: HTTPHeaders = ["authorization": "Bearer " + self.user[0].data!.token]
        AF.request(url, method: .get, headers: headers).responseJSON
        {
            result in
            let data = JSON(result.data)
            
            print("I Have Loaded Projects")
            if result.response?.statusCode == 200
            {
                var newCase = Case()
                var newTeam = Team()
                var newMark = Mark()
                
                for loadedCase in data["cases"].arrayValue
                {
                    newCase.id = loadedCase["id"].stringValue
                    newCase.name = loadedCase["name"].stringValue
                    for team in loadedCase["teams"].arrayValue
                    {
                        newTeam.id = team["id"].stringValue
                        newTeam.name = team["name"].stringValue
                        for mark in team["marks"].arrayValue
                        {
                            newMark.id = mark["id"].stringValue
                            newMark.mark = mark["mark"].intValue
                            newMark.markType = mark["markType"].intValue
                            newTeam.marks[newMark.markType] = newMark
                        }
                        newCase.teams[newTeam.name] = newTeam
                    }
                    self.projects[newCase.name] = newCase
                    
                    print(self.projects.count)
                }
                self.namesOfProjects = self.projects.keys.sorted()
            }
            
            compilationHandler()
        }
        
    }
    func getCountOfProjects() -> Int
    {
        return projects.count
    }
    func getProjectNames(key: Int) -> String
    {
        return namesOfProjects[key]
    }
    func getTeamsOfProject(nameOfProject: String) -> [String:Team]
    {
        return projects[nameOfProject]!.teams
    }
    
    func deleteDataOfUser()
    {
        
        
        let url = "https://api.cybergarden.ru/auth/logout"
        let headers: HTTPHeaders = ["authorization": "Bearer " + self.user[0].data!.token]
        
        try! realm.write
        {
            realm.deleteAll()
        }
        
        AF.request(url, method: .post, headers:
                    headers).responseJSON
        {
            result in
            print(result.response?.statusCode)
        }
        
    }
    //
    //    func getDataAboutProjects() -> [String]
    //    {
    //        return infoProjects
    //    }
    //
    //    func getDataAboutOneProject(key: Int) -> String
    //    {
    //        return infoProjects[key]
    //    }
    
    func getTitle() -> String
    {
        return title
    }
}


