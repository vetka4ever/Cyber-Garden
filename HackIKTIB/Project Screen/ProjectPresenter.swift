//
//  TeamPresenter.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import Foundation
import UIKit
class ProjectPresenter
{
    private let model = ProjectModel()
    
    
//    func updateTeams(teams: [String: Team])
//    {
//        // here will be get request, but now
//        model.getTeams(teams: teams)
//    }
//    func updateInfoTeam()
//    {
//
//    }
    
//    func writeId(id: String)
//    {
//        model.writeId(id: id)
//    }
    
    func nameOfTeam(id: Int) -> String
    {
        return model.getNameOfTeam(id: id)
    }
    
    func countOfTeams() -> Int
    {
        return model.getCountOfTeams()
    }
    
    
    func updateDescribeView(title: String) -> UINavigationController
    {
        
        let view = DescribeView()
        view.title = title
        let describeView = UINavigationController(rootViewController: view)
        
        return describeView
    }
    
    func updateTitle() -> String
    {
        return model.getTitle()
        
    }
    
    func updateTeamView(nameOfTeam: String) -> TeamView
    {
        model.correctTeams(nameOfTeam: nameOfTeam)
        let view = TeamView()
//        view.writeIdOfCase(name: model.getIdOfCase())
//        view.writeIdOfTeam(name: model.getIdOfTeam(nameOfTeam: nameOfTeam))
        return view
    }
    
}
