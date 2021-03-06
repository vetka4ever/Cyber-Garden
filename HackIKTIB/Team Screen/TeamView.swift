//
//  TeamView.swift
//  HackIKTIB
//
//  Created by Daniil on 06.10.2021.
//

import UIKit

class TeamView: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    private var tableView = UITableView()
    private let labelForNameOfTeam = UILabel()
    //    private var teamName = ""
    private var presenter = TeamPresenter()
    private var idCell = "Cell"
    
    //MARK: LIFE CYCLE
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //HIDING KEYBOARD WHEN USER TAP SCREEN
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_:)))
        self.view.addGestureRecognizer(gesture)
        setTableView()
        title = presenter.title()
        
        
        
//        labelForNameOfTeam.text = presenter.nameOfTeam()
//        self.navigationItem.titleView = labelForNameOfTeam
        self.navigationController?.navigationBar.prefersLargeTitles = false
        let sendButton = UIBarButtonItem(image: UIImage(systemName: "checkmark.circle"), style: .plain, target: self, action: #selector(alertUserAboutSending))
        let questionButton = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"), style: .plain, target: self, action: #selector(showInfo))
        self.navigationItem.rightBarButtonItems = [sendButton, questionButton]
        //        self.navigationItem.rightBarButtonItems = [sendButton]
        
        
        view.backgroundColor = .systemGray5
        
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        //        presenter.updateTypeOfMark { self.tableView.reloadData() }
    }
    
    func setTableView()
    {
//        tableView.estimatedRowHeight = 600
//        tableView.rowHeight = UITableView.automaticDimension
        
        tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PointOfJuryCell.self, forCellReuseIdentifier: idCell)
        tableView.backgroundColor = .systemGray5
        view.addSubview(tableView)
    }
    
    
    
    @objc func hideKeyboard(_ sender: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    @objc func showInfo()
    {
        let descriptionView = presenter.createDescriptionOfTeamView()
        present(descriptionView, animated: true, completion: nil)
    }
    
    @objc func alertUserAboutSending()
    {
        let action: ((UIAlertAction) -> Void)? =
        {
            (action) in
            self.sendPoint()
        }
        let alert = presenter.getAlertAboutSending(handlerForOkAction: action!)
        present(alert, animated: true, completion: nil)
    }
    
//    func sendPointt() -> ((UIAlertAction) -> Void)?
//    {
//        let action: ((UIAlertAction) -> Void)? =
//        {
//            (action) in
//            self.sendPoint()
//        }
//        return action
//    }
    
    private func sendPoint()
    {
        var points = [String:String]()
        for item in tableView.visibleCells
        {
            guard let cell = item as? PointOfJuryCell else {return}
            //            print(" \(cell.getTitle()) - \(cell.getPoint())")
            points[cell.getTitle()] = cell.getPoint()
        }
        presenter.sendPoint(points: points)
        {
            sended in
            self.present(self.presenter.getAlertController(navigationController: self.navigationController!, sended: sended), animated: true, completion: nil)
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return presenter.countOfTypeOfMarks()
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        600
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! PointOfJuryCell
        cell.selectionStyle = .none
        
        cell.setTitle(title: presenter.typeOfMarkWithId(id: indexPath.row))
        let point = presenter.placeholder(typeOfPoint: cell.getTitle())
        cell.setPlaceHolder(point: point)
    
        
        //        print(point)
        
        //        cell.reloadInputViews()
        cell.backgroundColor = .white
        return cell
    }
    
    
}
