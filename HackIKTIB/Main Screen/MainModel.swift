//
//  MainModel.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import Foundation
class MaindModel
{
    private let title = "Проекты"
    private var name = ""
    private var projects = ["Навигация", "Блокчейн", "Дорожное полотно"]
    private var infoProjects = ["Инфо Навигация", "Инфо Блокчейн", "Инфо Блокчейн"]
    
     func getNameOfJury() -> String
    {
        if name == ""
        {
            // request
            // name = data from request
            name = "Инна Олеговна \n Г - 412"
        }
        return name
    }
    func getProjectNames() -> [String]
    {
        return projects
    }
    
    func getDataAboutProjects() -> [String]
    {
        return infoProjects
    }
    
    func getDataAboutOneProject(key: Int) -> String
    {
        return infoProjects[key]
    }
    
    func getTitle() -> String
    {
        return title
    }
}


