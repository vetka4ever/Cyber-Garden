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
//    func labelForNameOfTeam() -> UILabel
//    {
//        let labelForNameOfTeam = UILabel()
//        labelForNameOfTeam.text =
//    }
    func nameOfTeam()->String
    {
        var name = model.getNameOfTeam()
        return name
    }
    
    func title()->String
    {
        var title = model.getTitle()
        return title
        
    }
    
//    func writeNameOfTeam(name: String)
//    {
//        model.writeNameOfTeam(name: name)
//    }
    
    func typeOfMarkWithId(id: Int) -> String
    {
        return model.getTypeOfMarkWithId(id: id)
    }
    
    func countOfTypeOfMarks() -> Int
    {
        return model.getCountOfTypeOfMarkWithId()
    }
    
    func updateTypeOfMark(compilationHandler: @escaping ()->())
    {
        model.getTypeOfMarks {
            compilationHandler()
        }
    }
    
//    func writeIdOfTeam(name: String)
//    {
//        model.writeIdOfTeam(name: name)
//    }
//    
//    func writeIdOfCase(name: String)
//    {
//        model.writeIdOfCase(name: name)
//    }
    
    func sendPoint(points: [String:String])
    {
        var newPoints = [String:Int]()
        for (key,value) in points
        {
            newPoints[key] = Int(value) ?? 0
        }
        model.sendPoint(points: newPoints)
        
    }
    
}

