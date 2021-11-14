//
//  TeamView.swift
//  HackIKTIB
//
//  Created by Daniil on 06.10.2021.
//

import UIKit

class TeamView: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    var tableView = UITableView()
    var teamName = ""
    var presenter = TeamPresenter()
    var idCell = "Cell"
    
    func setTableView()
    {
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PointOfJuryCell.self, forCellReuseIdentifier: idCell)
        tableView.backgroundColor = .systemGray5
        view.addSubview(tableView)
    }
    
    func updatePoint(title: String, point: Decimal)
    {
        presenter.updateOnePoint(title: title, point: point)
    }
    
//
    
    
//    func writeIdOfTeam(name: String)
//    {
//        presenter.writeIdOfTeam(name: name)
//    }
//    
//    func writeIdOfCase(name: String)
//    {
//        presenter.writeIdOfCase(name: name)
//    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        presenter.updateTypeOfMark {
            self.tableView.reloadData()
        }
        setTableView()
        title = presenter.title()
        teamName = presenter.nameOfTeam()
        
        
        
        let labelForNameOfTeam = UILabel()
        labelForNameOfTeam.text = teamName
        self.navigationItem.titleView = labelForNameOfTeam
        
        let questionButton = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"), style: .plain, target: self, action: #selector(showInfo))
        let sendButton = UIBarButtonItem(image: UIImage(systemName: "checkmark.circle"), style: .plain, target: self, action: #selector(sendPoint))
//        self.navigationItem.rightBarButtonItem = rightButton
        self.navigationItem.rightBarButtonItems = [sendButton, questionButton]
        
        
        view.backgroundColor = .systemGray5
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    @objc func showInfo()
    {
        let view = DescribeView()
        view.title =  teamName
        print(view.title)
        let describeView = UINavigationController(rootViewController: view)
        present(describeView, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return presenter.countOfTypeOfMarks()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! PointOfJuryCell
        cell.setTitle(title: presenter.typeOfMarkWithId(id: indexPath.row))
//        cell.title.text = sortOfPoints[indexPath.row]
//        cell.setTitle(title: sortOfPoints[indexPath.row])
        
        cell.backgroundColor = .white
        //        cell.textLabel?.text = sortOfPoints[indexPath.row]
        return cell
    }
    
    
    @objc func sendPoint()
    {
        var points = [String:String]()
        
        for item in tableView.visibleCells
        {
            guard let cell = item as? PointOfJuryCell else {return}
            print(" \(cell.getTitle()) - \(cell.getPoint())")
            points[cell.getTitle()] = cell.getPoint()
        }
        presenter.sendPoint(points: points)
        
    }
}
