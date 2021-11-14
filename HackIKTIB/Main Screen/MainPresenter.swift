//
//  MainPresenter.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import Foundation
import UIKit
class MainPresenter
{
    private var model = MaindModel()
    
     private func updateNameOfJury() -> String
    {
        return model.getNameOfJury()
    }
    
     func getInfoLabel() -> UILabel
    {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = model.getNameOfJury()
        
        return label
    }
    
    func getLeftItemForNavigationBar() -> UIBarButtonItem
    {
        let image = UIImage.init(systemName: "power")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        return UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
    }
    
    func loadProjects(compilationHandler: @escaping ()->())
    {
        model.loadProjects {
            compilationHandler()
        }
    }
    
    func deleteDataOfUser()
    {
        model.deleteDataOfUser()
    }
    
    func updateProjectName(key: Int) -> String
    {
        return model.getProjectNames(key: key)
    }
//    func updateDataAboutProject() -> [String]
//    {
//        return model.getDataAboutProjects()
//    }
    
    func updateCountOfProjects() -> Int
    {
        return model.getCountOfProjects()
    }
    
    func updateToken(compilationHandler: @escaping ()->())
    {
        model.updateToken {
            compilationHandler()
        }
    }
    
    func updateProjectView(nameOfProject: String) -> ProjectView
    {
        model.saveProjectInLocalMamory(nameOfProject: nameOfProject)
        let projectScreen = ProjectView()
       
//        let teamsOfProject = model.getTeamsOfProject(nameOfProject: nameOfProject)
//        let id = model.getIdOfTeams(nameOfProject: nameOfProject)
//        projectScreen.writeTeams(teams: teamsOfProject)
//        projectScreen.writeId(id: id)
        
        return projectScreen
    }
//    func updateDescribeView(key: Int) -> UINavigationController
//    {
//        let view = DescribeView()
//        view.title = model.getProjectNames(key)
//        view.describe.text = model.getDataAboutOneProject(key: key)
//        let navigationController = UINavigationController(rootViewController: view)
//        return navigationController
//    }
    
    func updateTitle() -> String
    {
        return model.getTitle()
    }
}
