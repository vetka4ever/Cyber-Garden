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
    
//     func updateNameOfJury() -> String
//    {
//        return model.getNameOfJury()
//    }
    
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
        return UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    
    
    
    
    func updateProjectName() -> [String]
    {
        return model.getProjectNames()
    }
    func updateDataAboutProject() -> [String]
    {
        return model.getDataAboutProjects()
    }
    
    
    func updateProjectView(id: Int, projects: [String]) -> ProjectView
    {
        let projectScreen = ProjectView()
        projectScreen.id = id
        projectScreen.projectLabel.text = projects[id]
        
        return projectScreen
    }
    func updateDescribeView(key: Int) -> UINavigationController
    {
        let view = DescribeView()
        view.title = model.getProjectNames()[key]
        view.describe.text = model.getDataAboutOneProject(key: key)
        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
    }
    
    func updateTitle() -> String
    {
        return model.getTitle()
    }
}
