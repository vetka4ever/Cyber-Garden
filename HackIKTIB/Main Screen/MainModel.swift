//
//  MainModel.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import Foundation
struct MaindModel
{
    func getProjectName() -> [String]
    {
        // here will be get request, but now
        let teams = ["Навигация", "Блокчейн", "Дорожное полотно"]
        return teams
    }
    
    func getDataAboutProject() -> [String]
    {
        let infoTeams = ["Инфо Навигация", "Инфо Блокчейн", "Инфо Блокчейн"]
        return infoTeams
    }
}
