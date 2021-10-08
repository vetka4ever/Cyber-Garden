//
//  TeamView.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import UIKit

class ProjectView: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    var nameOfProject = ""
    var aboutProject = ""
    var projectLabel = UILabel()
    let presenter = ProjectPresenter()
    var teams = [String]()
    let idCell = "cell"
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .systemGray5
        title = "Команды"
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"), style: .plain, target: self, action: #selector(showInfo))
        self.navigationItem.rightBarButtonItem = rightButton
        projectLabel.text = nameOfProject
        self.navigationItem.titleView = projectLabel
        
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        tableView.backgroundColor = .systemGray5
        view.addSubview(tableView)
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
            self.showInfo()
        }
        questionSwipe.image = UIImage(systemName: "questionmark.circle")
        questionSwipe.backgroundColor = .systemBlue
        let swipe = UISwipeActionsConfiguration(actions: [questionSwipe])
        swipe.performsFirstActionWithFullSwipe = false
        
        return swipe
        
    }
    @objc func showInfo()
    {
        
//        let alert = UIAlertController(title: "Подробнее о проекте", message: aboutTeam, preferredStyle: .alert)
//        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
//        alert.addAction(ok)
//        present(alert, animated: true, completion: nil)
        let view = DescribeView()
        view.describe.text = aboutProject
        view.title = "Подробнее о проекте"
        let describeView = UINavigationController(rootViewController: view)
        
        present(describeView, animated: true, completion: nil)
        
    }

   

}