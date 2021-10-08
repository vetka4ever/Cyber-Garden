//
//  MainScreen.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import UIKit

class MainScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var infoLabel = UILabel()
    var tableView = UITableView()
    var presenter = MainPresenter()
    var projects = [String]()
    var idCell = "cell"
    
    func setTableView()
    {
        tableView = UITableView(frame: self.view.frame, style: .insetGrouped)
//        tableView.frame = CGRect(x: 0, y: infoLabel.frame.height, width: self.view.frame.width, height: self.view.frame.height)
        tableView.frame.origin.y = infoLabel.frame.height
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        tableView.backgroundColor = .systemGray5
        view.addSubview(tableView)
    }
    func setInfoLabel()
    {
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        infoLabel.text = "Инна Олеговна \n Г - 412"
        
        
    }
    func setNavigationBar()
    {
       
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem = item
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Проекты"
        self.navigationItem.titleView = infoLabel
//        view.addSubview(infoLabel)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setInfoLabel()
        setTableView()
        setNavigationBar()
        projects = presenter.updateTeamsName()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell)!
        cell.textLabel?.text = projects[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let teamScreen = ProjectView()
        
        tableView.cellForRow(at: indexPath)?.isSelected = false
        teamScreen.nameOfProject = projects[indexPath.row]
        teamScreen.aboutProject = presenter.updateDataAboutTeam()[indexPath.row]
        teamScreen.teams = teamScreen.presenter.updateTeams()[indexPath.row]
        navigationController?.pushViewController(teamScreen, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let questionSwipe = UIContextualAction(style: .normal, title: "Подробнее")
        { (action, view, success) in
            self.showInfo(indexPath)
        }
        questionSwipe.image = UIImage(systemName: "questionmark.circle")
        questionSwipe.backgroundColor = .systemBlue
        let swipe = UISwipeActionsConfiguration(actions: [questionSwipe])
        swipe.performsFirstActionWithFullSwipe = false

        return swipe

    }
    
    @objc func showInfo(_ indesPath: IndexPath)
    {
        let view = DescribeView()
        view.describe.text = ""
        view.title = "Подробнее о " + projects[indesPath.row]
        let describeView = UINavigationController(rootViewController: view)
        
        present(describeView, animated: true, completion: nil)
    }
}
