//
//  MainScreen.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import UIKit

class MainScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var presenter = MainPresenter()
    private var nameLabel = UILabel()
    private var tableView = UITableView()
    private var projects = [String]()
    private var idCell = "cell"
    
    func setTableView()
    {
        tableView = UITableView(frame: self.view.frame, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        tableView.backgroundColor = .systemGray5
        view.addSubview(tableView)
    }
    
    func setNavigationBar()
    {
        self.navigationItem.titleView = presenter.getInfoLabel()
        self.navigationItem.leftBarButtonItem = presenter.getLeftItemForNavigationBar()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = presenter.updateTitle()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        projects = presenter.updateProjectName()
        setTableView()
    }
    
    //MARK: SET TABLE VIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        projects.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell)!
        cell.textLabel?.text = projects[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let teamScreen = presenter.updateProjectView(id: indexPath.row, projects: projects)
        tableView.cellForRow(at: indexPath)?.isSelected = false
        navigationController?.pushViewController(teamScreen, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let questionSwipe = UIContextualAction(style: .normal, title: "Подробнее")
        { (action, view, success) in
            
            self.showInfo(indexPath)
        }
        
        let image = UIImage(systemName: "questionmark.circle")
        questionSwipe.image = image
        questionSwipe.backgroundColor = .systemBlue
        let swipe = UISwipeActionsConfiguration(actions: [questionSwipe])
        swipe.performsFirstActionWithFullSwipe = false
        return swipe
        
    }
    
    func showInfo(_ indesPath: IndexPath)
    {
        let view = presenter.updateDescribeView(key: indesPath.row)
        present(view, animated: true, completion: nil)
    }
}
