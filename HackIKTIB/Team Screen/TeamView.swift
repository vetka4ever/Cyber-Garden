//
//  TeamView.swift
//  HackIKTIB
//
//  Created by Daniil on 06.10.2021.
//

import UIKit

class TeamView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView = UITableView()
    var teamName = ""
    var idCell = "Cell"
    var sortOfPoints = ["Оригинальность","Креативность","Привлекающие технологии"]
    override func viewDidLoad(){
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        tableView.backgroundColor = .systemGray5
        let labelForNameOfTeam = UILabel()
        labelForNameOfTeam.text = teamName
        self.navigationItem.titleView = labelForNameOfTeam
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"), style: .plain, target: self, action: #selector(showInfo))
        self.navigationItem.rightBarButtonItem = rightButton
        title = "Оценка команды"
        view.backgroundColor = .systemGray5
        view.addSubview(tableView)
    }
    @objc func showInfo()
    {
        let view = DescribeView()
        view.title = "Подробнее о " + teamName
        print(view.title)
        let describeView = UINavigationController(rootViewController: view)
        present(describeView, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell)!
        cell.textLabel?.text = sortOfPoints[indexPath.row]
        return cell
    }
    

}
