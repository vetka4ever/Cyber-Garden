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
    
    func nameOfProject() -> String
    {
        return model.getNameOfProject();
    }
    
    func updateTeamView(nameOfTeam: String) -> TeamView
    {
        model.editKeepingProject(nameOfTeam: nameOfTeam)
        let view = TeamView()
        return view
    }
    
    func createDescriptionOfTeamView(nameOfTeam: String) -> UINavigationController
    {
        let descriptionView = DescriptionView()
        descriptionView.title = nameOfTeam
        descriptionView.setDescription(description: model.getDataAboutOneTeam(nameOfTeam: nameOfTeam))
        let describeView = UINavigationController(rootViewController: descriptionView)
        
        return describeView
    }
    
    func createDescriptionOfProjectView() -> UINavigationController
    {
        let descriptionView = DescriptionView()
        descriptionView.title = model.getNameOfProject()
        descriptionView.setDescription(description: model.getDataAboutProject())
        let navigationController = UINavigationController(rootViewController: descriptionView)
        
        return navigationController
    }
    
}
