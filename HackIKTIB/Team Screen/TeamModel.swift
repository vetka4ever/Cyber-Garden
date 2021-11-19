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
    //    private var typeOfMarks = [String:Int]()
    private let typeOfMarks : Results<TypeOfMarkRealm> =
    {
        let types = (try! Realm()).objects(TypeOfMarkRealm.self)
        return types
    }()
    private var marks = [String]()
    private let user : Results<AuthGetRealm> =
    {
        let user = (try! Realm()).objects(AuthGetRealm.self)
        return user
    }()
    private let project : Results<KeepingProjectRealm> =
    {
        let project = (try! Realm()).objects(KeepingProjectRealm.self)
        //                print(project[0].data)
        return project
    }()
    
    //    func getTeamDescribe() -> [String]
    //    {
    //        [""]
    //    }
    
    //    func writeOnePoint(title: String, point: Decimal)
    //    {
    //        self.points[title] = point
    //        print(points)
    //    }
    //    func getTypeOfMarks(compilationHandler: @escaping ()->())
    //    {
    //        let url = "https://api.cybergarden.ru/system/appdata"
    //        let headers: HTTPHeaders = ["authorization": "Bearer " + self.user[0].data!.token]
    //        AF.request(url, method: .get, headers: headers).responseJSON
    //        {
    //            response in
    //            if response.response?.statusCode == 200
    //            {
    //                let data = JSON(response.data)["markType"].dictionaryValue
    //                for (key,value) in data
    //                {
    //                    self.typeOfMarks[key] = value.intValue
    //                }
    //                //                print(self.typeOfMarks)
    //                self.marks = self.typeOfMarks.keys.sorted()
    //            }
    //            compilationHandler()
    //        }
    //    }
    
    func getNameOfTeam() -> String
    {
        return project[0].data!.teams.keys.first!
    }
    
    func getDataAboutTeam() -> String
    {
        return project[0].data!.teams.first!.value.description
        //        var nameOfTeam = project[0].data!.teams.first!.key
        //        description += "\n\nВаша оценка:\n"
        //        let idOfMark = typeOfMarks[0].data!.markType.keys.sorted()
        ////        let typeOfmark = typeOfMarks[0].data!.markType
        ////        {
        ////
        ////            let point =
        ////        }
        ////        for item in project[0].data!.teams[nameOfTeam]!.marks
        //        for item in idOfMark
        //        {
        //            description += item + " - "
        //            let markId = typeOfMarks[0].data!.markType[item]
        //            description += "\(project[0].data!.teams[nameOfTeam]!.marks[markId!]!.mark)\n"
        //
        ////            description += typeOfMarks[0].data!.markType[item]
        ////            item.value.markType
        //        }
        //        return description
    }
    
    
    func getTitle()->String
    {
        return self.title
    }
    
    func getTypeOfMarkWithId(id: Int) -> String
    {
        return typeOfMarks[0].data!.markType.keys.sorted()[id]
    }
    
    func getCountOfTypeOfMarkWithId() -> Int
    {
        return typeOfMarks[0].data!.markType.count
    }
    
    func updateToken()
    {
        print("UPDATING TOKEN OF USER...")
        let url = "https://api.cybergarden.ru/auth/login"
        let parameter = AuthSend(login: user[0].data!.user.login, password: user[0].data!.user.password)
        AF.request(url, method: .post, parameters: parameter).responseJSON
        {
            result in
            let data = JSON(result.data)
            result.response?.statusCode
            if result.response?.statusCode == 200
            {
                var currentUser = AuthGet()
                currentUser.user.firstName = data["user"]["firstName"].stringValue
                currentUser.user.lastName = data["user"]["lastName"].stringValue
                currentUser.user.id = data["user"]["id"].stringValue
                currentUser.user.login = data["user"]["login"].stringValue
                currentUser.user.password = self.user[0].data!.user.password
                currentUser.token = data["token"].stringValue
                
                try! (try! Realm()).write
                {
                    self.user[0].data = currentUser
                }
            }
            print(result.response?.statusCode == 200 ? ("UPDATED TOKEN OF USER: \(self.user[0].data?.token)") : ("TOKEN DIN'T UPDATE"))
        }
    }
    
    func sendPoint(points: [String:Int], compilationHandler: @escaping (Bool)->())
    {
        
        let idOfCase =  project[0].data!.id
        let idOfTeam = project[0].data!.teams.first!.value.id
        let url = "https://api.cybergarden.ru/cases/\(idOfCase)/teams/\(idOfTeam)/marks"
        let headers: HTTPHeaders = ["authorization": "Bearer " + self.user[0].data!.token]
        for (key,value) in points
        {
            let parameters = MarkSend(markType: typeOfMarks[0].data!.markType[key]!, mark: value)
            
            let encoder = JSONParameterEncoder()
            var sended = false
            AF.request(url, method: .post, parameters: parameters, encoder: encoder, headers: headers).responseJSON
            {
                response in
                print("STATUS CODE RESPONSE OF MARK: \(response.response?.statusCode)")
                if response.response?.statusCode == 200
                {
                    sended = true
                }
                compilationHandler(sended)
            }
        }
    }
    
    func getPlaceholder(typeOfPoint: String) -> Int
    {
        var placeholder = -1
        if project[0].data?.teams.first?.value.marks.count != 0
        {
            let idOfPoint = typeOfMarks[0].data!.markType[typeOfPoint]!
            
            for (item) in project[0].data!.teams.first!.value.marks
            {
                if item.key == idOfPoint
                {
                    placeholder = item.value.mark
                    break
                }
            }
        }
        return placeholder
    }
    
}
