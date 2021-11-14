//
//  TeamModel.swift
//  HackIKTIB
//
//  Created by Daniil on 06.10.2021.
//
import RealmSwift
import Alamofire
import SwiftyJSON
import UIKit
class TeamModel
{
    private var title = "Оценка команды"
    private var idOfCase = ""
    private var idOfTeam = ""
    private var typeOfMarks = [String:Int]()
    private var marks = [String]()
    private var points = [String : Decimal]()
    private var nameOfTeam = ""
    private let user : Results<AuthGetRealm> =
    {
        let user = (try! Realm()).objects(AuthGetRealm.self)
        return user
    }()
    private let project : Results<ProjectRealm> =
    {
        let project = (try! Realm()).objects(ProjectRealm.self)
        print(project[0].data)
        return project
    }()
    
//    func getTeamDescribe() -> [String]
//    {
//        [""]
//    }
    init()
    {
        idOfCase = project[0].data!.id
        nameOfTeam = project[0].data!.teams.keys.first!
        idOfTeam = project[0].data!.teams[nameOfTeam]!.id
    }
    
    func writeOnePoint(title: String, point: Decimal)
    {
        self.points[title] = point
        print(points)
    }
    func getTypeOfMarks(compilationHandler: @escaping ()->())
    {
        let url = "https://api.cybergarden.ru/system/appdata"
        let headers: HTTPHeaders = ["authorization": "Bearer " + self.user[0].data!.token]
        AF.request(url, method: .get, headers: headers).responseJSON
        {
            response in
            if response.response?.statusCode == 200
            {
                let data = JSON(response.data)["markType"].dictionaryValue
                for (key,value) in data
                {
                    self.typeOfMarks[key] = value.intValue
                }
                print(self.typeOfMarks)
                self.marks = self.typeOfMarks.keys.sorted()
            }
            compilationHandler()
        }
    }
    
    func getNameOfTeam() -> String
    {
        return nameOfTeam
    }
    
    
    
    func getTitle()->String
    {
        return self.title
    }
    
    func getTypeOfMarkWithId(id: Int) -> String
    {
        return marks[id]
    }
    
    func getCountOfTypeOfMarkWithId() -> Int
    {
        return marks.count
    }
    
//    func writeIdOfTeam(name: String)
//    {
//        self.idOfTeam = name
//        print("id of team")
//        print(name)
//    }
//
//    func writeIdOfCase(name: String)
//    {
//        self.idOfCase = name
//        print("id of case")
//        print(name)
//    }
    
    func sendPoint(points: [String:Int])
    {
        
        
        let url = "https://api.cybergarden.ru/cases/\(idOfCase)/teams/\(idOfTeam)/marks"
        let headers: HTTPHeaders = ["authorization": "Bearer " + self.user[0].data!.token]
        for (key,value) in points
        {
            
            let parameters = MarkSend(markType: typeOfMarks[key]!, mark: value)
            AF.request(url, method: .post, parameters: parameters, headers: headers).responseJSON
            {
                response in
                let data = JSON(response.data)
                print(data)
                print(self.typeOfMarks[key]!)
                print(value)
                print(response.response?.statusCode)
            }
            
        }
        
    }
}
