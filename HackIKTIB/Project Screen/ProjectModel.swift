//
//  TeamModel.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import Foundation
import RealmSwift
class ProjectModel
{
    private let title = "Команды"
    private var realm = try! Realm()
    private var nameOfTeams = [String]()
    private let project : Results<ProjectRealm> =
    {
        let project = (try! Realm()).objects(ProjectRealm.self)

        return project
    }()
    
    func getCountOfTeams() -> Int
    {
        return project[0].data!.teams.count
    }
    
    func getIdOfCase() -> String
    {
        return project[0].data!.id
    }
    
    func getIdOfTeam(nameOfTeam: String) -> String
    {
        return self.project[0].data!.teams[nameOfTeam]!.id
    }
    
    func getNameOfTeam(id: Int) -> String
    {
        return project[0].data!.teams.keys.sorted()[id]
    }
    
//    func correctTeams(nameOfTeam: String)
//    {
//        let
//        for (key, _) in project[0].data!.teams
//        {
//            if key != nameOfTeam
//            {
//                project[0].data!.teams[nameOfTeam] = nil
//            }
//        }
//    }
    
    func getTitle() -> String
    {
        return title
    }
}
