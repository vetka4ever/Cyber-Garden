//
//  ViewController.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import UIKit

class SignView: UIViewController, UITextFieldDelegate
{
    private let presenter = SignPresenter()
    private var login = UITextField()
    private var password = UITextField()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = presenter.updateTitle()
        view.backgroundColor = .systemGray5
        
        //HIDING KEYBOARD WHEN USER TAP SCREEN
        let recognize = UITapGestureRecognizer(target: self, action: #selector(regTap(_:)))
        view.addGestureRecognizer(recognize)
        
        // SET PASSWORD & LOGIN TEXT FIELDS
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
    // SET TYPE OF RETURN BUTTON
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == login
        {
            password.becomeFirstResponder()
        }
        else
        {
            textField.endEditing(true)
            presenter.updateData(login: login.text!, password: password.text!)
            {
                whatIShouldShow in
                whatIShouldShow is UIAlertController ? (self.present(whatIShouldShow, animated: true, completion: nil)) : (self.navigationController?.pushViewController(whatIShouldShow, animated: true))
            }
        }
        return true
    }
    // WHEN USER TAP LOGIN OR PASSWORD FIELD HE CAN SEE PLACEHOLDER & BLINKING STRIP IN THE SAME MOMENT.
    // SO, I HIDE & SHOW PLACEHOLDERS WHEN USER BEGIN & STOP EDIT DATA
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        textField.placeholder = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        textField.placeholder = ((textField == login) ? ("Логин") : ("Пароль") )
    }
}
