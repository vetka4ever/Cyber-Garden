//
//  TeamPresenter.swift
//  HackIKTIB
//
//  Created by Daniil on 06.10.2021.
//

import UIKit
class TeamPresenter
{
    private var model = TeamModel()
    func updateTeamDescribe() -> [String]
    {
        [""]
    }
    
     func updateOnePoint(title: String, point: Decimal)
    {
        model.writeOnePoint(title: title, point: point)
    }
    
}

