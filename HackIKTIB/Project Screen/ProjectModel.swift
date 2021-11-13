//
//  TeamModel.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import Foundation
class ProjectModel
{
    private let title = "Команды"
    private var teams = [String: Team]()
    private var nameOfTeams = [String]()
//    private var teams = [["Winx", "Winston", "Одуванчики"], ["Angry Birds", "Do Nice", "OneOfTheBest"], ["Awesome", "Смешарики","Чудеса на виражах"]]
    
    func getTeams(teams: [String: Team])
    {
        self.teams = teams
        nameOfTeams = teams.keys.sorted()
    }
    
    func getNameOfTeam(id: Int) -> String
    {
        return nameOfTeams[id]
    }
    
    func getCountOfTeams() -> Int
    {
        return teams.keys.count
    }
    
    func getTitle() -> String
    {
        return title
    }
}
