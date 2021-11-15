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
    
    func nameOfTeam(id: Int) -> String
    {
        return model.getNameOfTeam(id: id)
    }
    
    func countOfTeams() -> Int
    {
        return model.getCountOfTeams()
    }
    
    func updateTitle() -> String
    {
        return model.getTitle()
        
    }
    
    func updateTeamView(nameOfTeam: String) -> TeamView
    {
//        model.correctTeams(nameOfTeam: nameOfTeam)
        let view = TeamView()
        return view
    }
    
    //    func updateDescribeView(title: String) -> UINavigationController
    //    {
    //        let view = DescribeView()
    //        view.title = title
    //        let describeView = UINavigationController(rootViewController: view)
    //
    //        return describeView
    //    }
    
}
