//
//  pointOfJuryCell.swift
//  HackIKTIB
//
//  Created by Daniil on 11.10.2021.
//

import UIKit

class PointOfJuryCell: UITableViewCell, UITextFieldDelegate {
    
    private var title = UILabel()
    private var point = UITextField()
    private var previouslyMark = 0
    
    override func layoutSubviews() {
        title.frame = CGRect(x: 5, y: 0, width: self.frame.width / 2, height: self.frame.height)
        title.numberOfLines = 0
        title.textAlignment = .center
        title.textColor = .black
        
        let insetForCell = self.frame.height * 0.1
        let newHeight = self.frame.height - insetForCell * 2
        point.frame = CGRect(x: self.frame.width / 1.6, y: insetForCell, width: self.frame.width / 4 , height: newHeight)
        
        point.backgroundColor = .systemGray5
        point.textAlignment = .center
        point.layer.cornerRadius = point.frame.height / 2
        point.keyboardType = .numberPad
        self.contentView.addSubview(title)
        self.contentView.addSubview(point)
        
        self.point.delegate = self
       
    
    }
    
    func getTitle() -> String
    {
        return self.title.text!
    }
    
    func setTitle(title: String)
    {
        self.title.text = title
    }
    
    func getPoint() -> String
    {
        return self.point.text!
    }
    
    func setPoint(title: String)
    {
        self.point.text = title
    }
    
    func setPlaceHolder(point: Int)
    {
//        self.placeholder = point
        if point == -1
        {
            self.point.placeholder = ""
        }
        else
        {
        self.point.placeholder = String(point)
        }
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField)
//    {
//
//    }
    func textFieldDidChangeSelection(_ textField: UITextField)
    {
        guard let point = Decimal(string: textField.text!) else {return}
//        print(point)
        
        if point > 10
        {
            textField.text = "10"
        }
        else if point < 0
        {
            textField.text = "0"
        }
        else
        {
            textField.text = "\(point)"
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        textField.placeholder = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        textField.placeholder = String(previouslyMark)
    }
}
