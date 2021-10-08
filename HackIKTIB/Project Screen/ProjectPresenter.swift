//
//  TeamPresenter.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import Foundation
struct ProjectPresenter
{
    private let model = ProjectModel()
    func updateTeams() -> [[String]]
    {
        // here will be get request, but now
        model.getTeams()
    }
}
