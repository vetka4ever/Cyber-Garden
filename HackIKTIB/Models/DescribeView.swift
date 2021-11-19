//
//  DescribeView.swift
//  HackIKTIB
//
//  Created by Daniil on 06.10.2021.
//

import UIKit

class DescriptionView: UIViewController {

    private var descriptionView = UITextView()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        descriptionView.frame = view.frame
        descriptionView.textAlignment = .center
        descriptionView.isEditable = false
        descriptionView.isSelectable = false
        navigationController?.navigationBar.backgroundColor = .systemGray5
//        view.backgroundColor =
        navigationController?.navigationBar.prefersLargeTitles = false
        view.addSubview(descriptionView)
    }
    
    func setDescription(description: String)
    {
        self.descriptionView.text = description
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
