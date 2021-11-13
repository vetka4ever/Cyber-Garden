//
//  TeamModel.swift
//  HackIKTIB
//
//  Created by Daniil on 06.10.2021.
//

import UIKit
class TeamModel
{
    var sortOfPoints = ["Оригинальность","Креативность","Привлекающие технологии"]
    private var points = [String : Decimal]()
    func getTeamDescribe() -> [String]
    {
        [""]
    }
    
    func writeOnePoint(title: String, point: Decimal)
    {
        self.points[title] = point
        print(points)
    }
}
