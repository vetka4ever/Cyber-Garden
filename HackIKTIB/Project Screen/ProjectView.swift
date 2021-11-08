//
//  TeamView.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import UIKit

class ProjectView: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    var id = 0
    var projectLabel = UILabel()
    let presenter = ProjectPresenter()
    var teams = [String]()
    let idCell = "cell"
    var tableView = UITableView()
    
    func setTableView()
    {
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        tableView.backgroundColor = .systemGray5
        teams = presenter.updateTeams(key: id)
        view.addSubview(tableView)
    }
    
    func setNavigationBar()
    {
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"), style: .plain, target: self, action: #selector(showInfoAboutProject))
        
        self.navigationItem.rightBarButtonItem = rightButton
//        projectLabel.text = nameOfProject
        self.navigationItem.titleView = projectLabel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        title = presenter.updateTitle()
        setTableView()
        setNavigationBar()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell)!
        cell.textLabel?.text = teams[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = TeamView()
        view.teamName = teams[indexPath.row]
        navigationController?.pushViewController(view, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let questionSwipe = UIContextualAction(style: .normal, title: "Подробнее")
        { (action, view, success) in
            self.showInfoAboutTeam(key: indexPath.row)
        }
        questionSwipe.image = UIImage(systemName: "questionmark.circle")
        questionSwipe.backgroundColor = .systemBlue
        let swipe = UISwipeActionsConfiguration(actions: [questionSwipe])
        swipe.performsFirstActionWithFullSwipe = false
        
        return swipe
        
    }
    @objc func showInfoAboutTeam(key: Int)
    {
        let view = DescribeView()
            view.title = teams[key]
            
        let describeView = UINavigationController(rootViewController: view)
        
        present(describeView, animated: true, completion: nil)
        
    }

    @objc func showInfoAboutProject()
    {
        let describeView = presenter.updateDescribeView(title: projectLabel.text!)
        present(describeView, animated: true, completion: nil)
        
    }

    
    
}
