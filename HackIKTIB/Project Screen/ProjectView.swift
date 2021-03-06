//
//  TeamView.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import UIKit

class ProjectView: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    var id = 0
    var viewWithNameOfTeam = UILabel()
    let presenter = ProjectPresenter()
    let idCell = "cell"
    var tableView = UITableView()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        title = presenter.updateTitle()
        setTableView()
        setNavigationBar()
        
    }
    
    func setTableView()
    {
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        tableView.backgroundColor = .systemGray5
        view.addSubview(tableView)
    }
    
    func setNavigationBar()
    {
        
//        viewWithNameOfTeam.text = presenter.nameOfProject()
//        self.navigationItem.titleView = viewWithNameOfTeam
//        self.title = "Команды"
//        self.navigationItem.title = presenter.updateTitle()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"), style: .plain, target: self, action: #selector(showInfoAboutProject))
//
        self.navigationItem.rightBarButtonItem = rightButton

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        presenter.countOfTeams()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell)!
        cell.textLabel?.text = presenter.nameOfTeam(id: indexPath.row)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.cellForRow(at: indexPath)?.isSelected = false
        let nameOfTeam = tableView.cellForRow(at: indexPath)?.textLabel?.text
        print(nameOfTeam)
        let view = presenter.updateTeamView(nameOfTeam: nameOfTeam!)
        
        navigationController?.pushViewController(view, animated: true)
//        let view = TeamView()
//        view.writeNameOfTeam(name: presenter.nameOfTeam(id: indexPath.row))
//        navigationController?.pushViewController(view, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let teamName = tableView.cellForRow(at: indexPath)?.textLabel?.text
        let questionSwipe = UIContextualAction(style: .normal, title: "Подробнее")
        { (action, view, success) in
            let describeView = self.presenter.createDescriptionOfTeamView(nameOfTeam: teamName!)
            self.present(describeView, animated: true, completion: nil)
        }
        questionSwipe.image = UIImage(systemName: "questionmark.circle")
        questionSwipe.backgroundColor = .systemBlue
        let swipe = UISwipeActionsConfiguration(actions: [questionSwipe])
        swipe.performsFirstActionWithFullSwipe = false
        
        return swipe
        
    }
    
//    @objc func showInfoAboutTeam(key: Int)
//    {
//        let view = DescribeView()
//            view.title = teams[key]
//            
//        let describeView = UINavigationController(rootViewController: view)
//        
//        present(describeView, animated: true, completion: nil)
//        
//    }
//
    @objc func showInfoAboutProject()
    {
        let describeView = presenter.createDescriptionOfProjectView()
        present(describeView, animated: true, completion: nil)
        
    }
}
