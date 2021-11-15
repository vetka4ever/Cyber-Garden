//
//  MainScreen.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import UIKit

class MainScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var presenter = MainPresenter()
    private var tableView = UITableView()
    private let refreshControl = UIRefreshControl()
    private var idCell = "cell"
    // MARK: LIFE CYCLE
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(alertExit(_:)))
        self.view.addGestureRecognizer(swipe)
        setTableView()
       
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        presenter.updateToken{}
        presenter.loadProjects { self.tableView.reloadData() }
        setNavigationBar()
    }
    //MARK: SET OF VIEW
    func setTableView()
    {
        tableView = UITableView(frame: self.view.frame, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: idCell)
        tableView.backgroundColor = .systemGray5
        
        refreshControl.attributedTitle = NSAttributedString(string: "Обновление...")
        refreshControl.addTarget(self, action: #selector(updateTableView(_:)), for: .valueChanged)
        
        tableView.refreshControl = refreshControl
        view.addSubview(tableView)
    }
    
    func setNavigationBar()
    {
        self.navigationItem.title = presenter.getTitle()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.leftBarButtonItem = presenter.getLeftBarButtonItem()
        self.navigationItem.titleView = presenter.getLabelOfNameOfUser()
        //        let image = UIImage.init(systemName: "power")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        //        let item = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(alertExit(_:)))
        //        self.navigationItem.leftBarButtonItem = item
    }
    //MARK: OBJECTIVE-C FUNCS
    @objc func alertExit(_ sender: UISwipeGestureRecognizer)
    {
        guard sender.direction == .right else {return}
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
    
    @objc func updateTableView(_ sender: UIRefreshControl)
    {
        presenter.updateToken{}
        presenter.loadProjects
        {
            self.tableView.reloadData()
        }
        refreshControl.endRefreshing()
    }
    
    //MARK: SET TABLE VIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let count = presenter.getCountOfProjects()
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell)!
        cell.textLabel?.text = presenter.getNameOfProject(key: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let nameOfProject = tableView.cellForRow(at: indexPath)?.textLabel?.text
        let teamScreen = presenter.createProjectView(nameOfProject: nameOfProject!)
        tableView.cellForRow(at: indexPath)?.isSelected = false
        navigationController?.pushViewController(teamScreen, animated: true)
    }
}
