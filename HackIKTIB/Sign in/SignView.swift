//
//  ViewController.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import UIKit

class SignView: UIViewController, UITextFieldDelegate {
    
    
    var login = UITextField()
    var password = UITextField()
    var button = UIButton()
    
    func setLoginField()
    {
        
        login.frame = CGRect(x: 10, y: self.view.frame.height / 4 , width: self.view.frame.width - 20, height: self.view.frame.height / 9)
        login.layer.cornerRadius = 10
//        login.placeholder = "Логин"
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
        password.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        //        print(password.font?.fontName)
        password.backgroundColor = .white
        password.textAlignment = .center
        password.returnKeyType = UIReturnKeyType.done
        password.delegate = self
        self.view.addSubview(password)
    }
    @objc func goMainScreen()
    {
        
        //        let alert : UIAlertController =
        //        {
        //            let alert = UIAlertController(title: "Warning", message: "", preferredStyle: .alert)
        //            alert.message = ((login.text == "") ? "You forget enter your login" : "You forget enter your password")
        //            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        //            alert.addAction(ok)
        //            return alert
        //        }()
        //
        //        if login.text != "" && password.text != ""
        //        {
        //            let mainScreen = MainScreen()
        //            navigationController?.pushViewController(mainScreen, animated: true)
        //        }
        //        else
        //        {
        //            present(alert, animated: true, completion: nil)
        let mainScreen = MainScreen()
        //        navigationController?.pushViewController(mainScreen, animated: true)
        navigationController?.pushViewController(mainScreen, animated: true)
        
        
        
    }
    
    
    func setButton()
    {
        button.frame = CGRect(x: 10, y: self.view.frame.height / 4 * 3, width: password.frame.width, height: password.frame.height)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Вход", for: .normal)
        button.addTarget(nil, action: #selector(goMainScreen), for: .touchDown)
        
        self.view.addSubview(button)
        
    }
    
    @objc func regTap(_ sender: UITapGestureRecognizer)
    {
        
        view.endEditing(true)
        navigationController?.navigationBar.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Авторизация"
        view.backgroundColor = .systemGray5
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let recognize = UITapGestureRecognizer(target: self, action: #selector(regTap(_:)))
        view.addGestureRecognizer(recognize)
        
        setLoginField()
        setPasswordView()
        setButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == login
        {
            password.becomeFirstResponder()
            
        }
        else
        {
            goMainScreen()
          
        }
        return true
    }
    
}

