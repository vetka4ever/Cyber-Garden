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
    private var presenter = TeamPresenter()
    var idCell = "Cell"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PointOfJuryCell.self, forCellReuseIdentifier: idCell)
        tableView.backgroundColor = .systemGray5
        
        let labelForNameOfTeam = UILabel()
        labelForNameOfTeam.text = teamName
        self.navigationItem.titleView = labelForNameOfTeam
        
        let questionButton = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"), style: .plain, target: self, action: #selector(showInfo))
        let sendButton = UIBarButtonItem(image: UIImage(systemName: "checkmark.circle"), style: .plain, target: self, action: nil)
//        self.navigationItem.rightBarButtonItem = rightButton
        self.navigationItem.rightBarButtonItems = [sendButton, questionButton]
        
        title = "Оценка команды"
        view.backgroundColor = .systemGray5
        view.addSubview(tableView)
    }
    @objc func showInfo()
    {
        
        for item in tableView.visibleCells
        {
            guard let cell = item as? PointOfJuryCell else {return}
//            print("\(cell.title.text) \(cell.point.text)")
            print(" \(cell.getTitle()) - \(cell.getPoint())")
        }
        
        let view = DescribeView()
        view.title =  teamName
        print(view.title)
        let describeView = UINavigationController(rootViewController: view)
        present(describeView, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! PointOfJuryCell
//        cell.title.text = sortOfPoints[indexPath.row]
//        cell.setTitle(title: sortOfPoints[indexPath.row])
        
        cell.backgroundColor = .white
        //        cell.textLabel?.text = sortOfPoints[indexPath.row]
        return cell
    }
    
    func updatePoint(title: String, point: Decimal)
    {
        presenter.updateOnePoint(title: title, point: point)
    }
    func sendPoint()
    {
        
    }
}
