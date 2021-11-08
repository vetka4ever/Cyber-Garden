//
//  ViewController.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import UIKit

class SignView: UIViewController, UITextFieldDelegate
{
    
    let presenter = SignPresenter()
    var login = UITextField()
    var password = UITextField()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = presenter.updateTitle()
        
        let recognize = UITapGestureRecognizer(target: self, action: #selector(regTap(_:)))
        view.addGestureRecognizer(recognize)
        
        let textFields = presenter.getLogButtons(view: view)
        login = textFields[0]
        password = textFields[1]
        login.delegate = self
        password.delegate = self
        
        view.addSubview(login)
        view.addSubview(password)
    }
    
    @objc func regTap(_ sender: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
}



/*
 MARK: PREVIOUSLY log and password text fields
 func setLoginField()
 {
     login.frame = CGRect(x: 10, y: self.view.frame.height / 4 , width: self.view.frame.width - 20, height: self.view.frame.height / 9)
     login.layer.cornerRadius = 10
     login.attributedPlaceholder = NSAttributedString(string: "Логин", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
     login.textColor = .black
     login.font = UIFont(name: "Large", size: login.frame.height / 4)
     login.backgroundColor = .white
     
     login.textAlignment = .center
     login.returnKeyType = UIReturnKeyType.continue
     login.delegate = self
     self.view.addSubview(login)
 }
 func setPasswordView()
 {
     password.frame = CGRect(x: 10, y: self.view.frame.height / 4 * 1.6 , width: login.frame.width, height: login.frame.height)
     password.textColor = .black
     password.font = UIFont(name: "Large", size: login.frame.height / 4)
     password.layer.cornerRadius = 10
     password.isSecureTextEntry = true
     password.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
     
     //        print(password.font?.fontName)
     password.backgroundColor = .white
     password.textAlignment = .center
     password.returnKeyType = UIReturnKeyType.done
     password.delegate = self
     self.view.addSubview(password)
 }
 */
