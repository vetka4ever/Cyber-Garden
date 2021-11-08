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
    
    
    func updateTeams(key: Int) -> [String]
    {
        // here will be get request, but now
        model.getTeams(key: key)
    }
    func updateInfoTeam()
    {
        
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
    
    
}
