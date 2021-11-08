//
//  SignPresenter.swift
//  HackIKTIB
//
//  Created by Daniil on 05.10.2021.
//

import Foundation
import UIKit
class SignPresenter
{
    private let model = SignModel()
    func updateTitle() -> String
    {
        return model.getTitle()
    }
    func getLogButtons(view: UIView) -> [UITextField]
    {
        
        let buttons = [UITextField(), UITextField()]
        let heightForResize = view.frame.height / 9
        let weightForResize = view.frame.width - 20
        
        
        
        for item in buttons
        {
            item.textColor = .black
            item.backgroundColor = .white
            item.textAlignment = .center
            item.font = UIFont(name: "Large", size: heightForResize / 4)
            item.frame.size = CGSize(width: weightForResize, height: heightForResize)
            item.layer.cornerRadius = 10
            
            if item == buttons[0]
            {
                item.frame.origin = CGPoint(x: 10, y: view.frame.height / 4)
                item.attributedPlaceholder = NSAttributedString(string: "Логин", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
                item.returnKeyType = UIReturnKeyType.continue
            }
            else
            {
                item.isSecureTextEntry = true
                item.frame.origin = CGPoint(x: 10, y: view.frame.height / 4 * 1.6)
                item.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
                item.returnKeyType = UIReturnKeyType.done
            }
        }
        
        
        return buttons
    }
    
    func updateData(login: String, password: String, compilationHandler: @escaping (UIViewController) ->())
    {
        
        let alert: UIAlertController =
        {
            let alertController = UIAlertController(title: "Внимание", message: "Указаны неверный логин или пароль", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(ok)
        return alertController
        }()
        
        let resultOfLogIn = model.getData(login: login, password: password)
        {
            success in
            let view: UIViewController = ((success) ? MainScreen() : alert)
            compilationHandler(view)
        }
        
        
        
       
        
        
        
    }
}

extension SignView
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField == login
        {
            password.becomeFirstResponder()
        }
        else
        {
            let resultOfLogIn = presenter.updateData(login: login.text!, password: password.text!)
            {
                whatIShouldShow in
                if whatIShouldShow is UIAlertController
                {
                    self.present(whatIShouldShow, animated: true, completion: nil)
                }
                else
                {
                    self.navigationController?.pushViewController(whatIShouldShow, animated: true)
                }
            }
            
            
        }
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        textField.placeholder = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        textField.placeholder = ((textField == login) ? ("Логин") : ("Пароль") )
    }
}
