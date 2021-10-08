//
//  MainPresenter.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import Foundation
struct MainPresenter
{
    private let model = MaindModel()
    func updateTeamsName() -> [String]
    {
        return model.getProjectName()
    }
    func updateDataAboutTeam() -> [String]
    {
        return model.getDataAboutProject()
    }
}
