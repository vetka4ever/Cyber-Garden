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
    private let typeOfMarks : Results<TypeOfMarkRealm> =
    {
        let types = (try! Realm()).objects(TypeOfMarkRealm.self)
        return types
    }()
    private let project : Results<ProjectRealm> =
    {
        let project = (try! Realm()).objects(ProjectRealm.self)
        
        return project
    }()
    
    private let keepingProject : Results<KeepingProjectRealm> =
    {
        let project = (try! Realm()).objects(KeepingProjectRealm.self)
        
        return project
    }()
    
    func getCountOfTeams() -> Int
    {
        return project[0].data!.teams.count
    }
    
    //    func getIdOfCase() -> String
    //    {
    //        return project[0].data!.id
    //    }
    
    //    func getIdOfTeam(nameOfTeam: String) -> String
    //    {
    //        return self.project[0].data!.teams[nameOfTeam]!.id
    //    }
    
    func getNameOfTeam(id: Int) -> String
    {
        return project[0].data!.teams.keys.sorted()[id]
    }
    
    func getDataAboutOneTeam(nameOfTeam: String) -> String
    {
        
        var description = project[0].data!.teams[nameOfTeam]!.description
        if project[0].data?.teams[nameOfTeam]?.marks.count != 0
        {
            description += "\n\nВаша оценка:\n"
            let idOfMark = typeOfMarks[0].data!.markType.keys.sorted()
            
            for item in idOfMark
            {
                description += item + " - "
                let markId = typeOfMarks[0].data!.markType[item]
                description += "\(project[0].data!.teams[nameOfTeam]!.marks[markId!]!.mark)\n"
            }
        }
        return description
    }
    
    func editKeepingProject(nameOfTeam: String)
    {
        let kurrentKeepingProject = realm.objects(KeepingProjectRealm.self)
        var keepingProj = project[0].data
        for (key, _) in keepingProj!.teams
        {
            if key != nameOfTeam
            {
                keepingProj!.teams[nameOfTeam] = nil
            }
        }
        
        try! realm.write
        {
            let object = KeepingProjectRealm()
            object.data = keepingProj
            kurrentKeepingProject.count == 0 ? (self.realm.add(object)) : (kurrentKeepingProject[0].data = object.data)
            //            if kurrentKeepingProject.count == 0
            //            {
            //                self.realm.add(object)
            //            }
            //            else
            //            {
            //                kurrentKeepingProject[0].data = object.data
            //            }
        }
        
        
    }
    
    func getTitle() -> String
    {
        return title
    }
    
    func getNameOfProject() -> String
    {
        return project[0].data!.name
    }
    
    func getDataAboutProject() -> String
    {
        return project[0].data!.description
        
    }
}
