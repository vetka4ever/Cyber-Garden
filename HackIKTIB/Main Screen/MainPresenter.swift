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
    
    // THIS METHOD RETURN LABEL WITH NAME OF USER
    func getLabelOfNameOfUser() -> UILabel
    {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = model.getNameOfJury()
        return label
    }
    // METHOD FOR GETTING ITEM FOR HIDING LEFT BAR BUTTON OF NAVIGATION ITEM IN SIGN IN VIEW
    func getLeftBarButtonItem() -> UIBarButtonItem
    {
        return UIBarButtonItem(image: nil, style: .done, target: self, action: nil)
    }
    
    func loadProjects(compilationHandler: @escaping ()->())
    {
        model.loadProjects { compilationHandler() }
    }
    
    func deleteDataOfUser()
    {
        model.deleteDataOfUser()
    }
    
    func getNameOfProject(key: Int) -> String
    {
        return model.getProjectName(key: key)
    }
    
    func getCountOfProjects() -> Int
    {
        return model.getCountOfProjects()
    }
    
    func updateToken(compilationHandler: @escaping ()->())
    {
        model.updateToken { compilationHandler() }
    }
    
    func typeOfMarks(compilationHandler: @escaping() -> ())
    {
        model.getTypeOfMarks { compilationHandler() }
    }
    
    
    func createProjectView(nameOfProject: String) -> ProjectView
    {
        model.saveProjectInLocalMamory(nameOfProject: nameOfProject)
        let projectScreen = ProjectView()
        return projectScreen
    }
    
    func getTitle() -> String
    {
        return model.getTitle()
    }
    
    func createDescribeView(nameOfProject: String) -> UINavigationController
    {
        
        let describeView = DescriptionView()
        describeView.setDescription(description: model.getDescriptionAboutOneProject(nameOfProject: nameOfProject))
        describeView.title = nameOfProject
        
        let navigationController = UINavigationController(rootViewController: describeView)
        return navigationController
    }
}
