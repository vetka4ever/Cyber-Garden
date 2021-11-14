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
    private var idCell = "cell"
    private var countOfProjects = 0
    
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
        let image = UIImage.init(systemName: "power")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        let item = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(alertExit(_:)))
        self.navigationItem.leftBarButtonItem = item
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = presenter.updateTitle()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        presenter.updateToken{}
        presenter.loadProjects
        {
            self.tableView.reloadData()
        }
        
        setNavigationBar()
    }
    
    
    @objc func alertExit(_ sender: UIBarButtonItem)
    {
        let alert = UIAlertController(title: "Внимание", message: "Вы уверены, что хотите выйти?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Да", style: .destructive)
        { (action) in
            self.presenter.deleteDataOfUser()
            //            self.navigationController?.setViewControllers([SignView()], animated: true)
            self.navigationController?.viewControllers = [SignView(), self]
            self.navigationController?.popViewController(animated: true)
        }
        let no = UIAlertAction(title: "Нет", style: .default, handler: nil)
        alert.addAction(ok)
        alert.addAction(no)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: SET TABLE VIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var count = presenter.updateCountOfProjects()
        return count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell)!
        cell.textLabel?.text = presenter.updateProjectName(key: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let nameOfProject = tableView.cellForRow(at: indexPath)?.textLabel?.text
        let teamScreen = presenter.updateProjectView(nameOfProject: nameOfProject!)
        tableView.cellForRow(at: indexPath)?.isSelected = false
        navigationController?.pushViewController(teamScreen, animated: true)
    }
    
    //    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
//    {
    //
    //        let questionSwipe = UIContextualAction(style: .normal, title: "Подробнее")
    //        { (action, view, success) in
    //
    //            self.showInfo(indexPath)
    //        }
    //
    //        let image = UIImage(systemName: "questionmark.circle")
    //        questionSwipe.image = image
    //        questionSwipe.backgroundColor = .systemBlue
    //        let swipe = UISwipeActionsConfiguration(actions: [questionSwipe])
    //        swipe.performsFirstActionWithFullSwipe = false
    //        return swipe
    //
    //    }
    
    //    func showInfo(_ indesPath: IndexPath)
    //    {
    //        let view = presenter.updateDescribeView(key: indesPath.row)
    //        present(view, animated: true, completion: nil)
    //    }
}

