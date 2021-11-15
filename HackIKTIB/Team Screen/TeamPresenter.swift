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
    
    //     func updateOnePoint(title: String, point: Decimal)
    //    {
    //        model.writeOnePoint(title: title, point: point)
    //    }
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
    
    func getAlertController(navigationController: UINavigationController, sended: Bool) -> UIAlertController
    {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        var ok = UIAlertAction()
        if sended == true
        {
            alert.title = "🥳"
            alert.message = "Оценка отправлена"
            ok = UIAlertAction(title: "Вернуться к проектам", style: .default)
            {
                action in
                let views = navigationController.viewControllers
                
                if views[0] is SignView
                {
                    navigationController.popToViewController(views[1], animated: true)
                }
                else
                {
                    navigationController.popToRootViewController(animated: true)
                }
            }
            alert.addAction(ok)
        }
        else
        {
            alert.title = "Внимание"
            alert.message = "Что-то пошло не так"
            ok = UIAlertAction(title: "Попробовать снова", style: .default)
            {
                (action) in
                self.model.updateToken()
            }
            alert.addAction(ok)
        }
        //        let alert = UIAlertController(title: "🥳", message: "Оценка отправлена", preferredStyle: .alert)
        //        let ok = UIAlertAction(title: "Вернуться к проектам", style: .default)
        //        {
        //
        //            action in
        //            let views = navigationController.viewControllers
        //            if views[0] is SignView
        //            {
        //                navigationController.popToViewController(views[1], animated: true)
        //            }
        //            else
        //            {
        //                navigationController.popToRootViewController(animated: true)
        //            }
        //        }
        //        alert.addAction(ok)
        
        return alert
    }
    
    func sendPoint(points: [String:String], compilationHandler: @escaping (Bool)->())
    {
        var newPoints = [String:Int]()
        for (key,value) in points
        {
            newPoints[key] = Int(value) ?? 0
        }
        model.sendPoint(points: newPoints)
        {
            sended in
            compilationHandler(sended)
        }
        
    }
    
}

