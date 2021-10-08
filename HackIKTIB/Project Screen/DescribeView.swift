//
//  DescribeView.swift
//  HackIKTIB
//
//  Created by Daniil on 06.10.2021.
//

import UIKit

class DescribeView: UIViewController {

    var describe = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        describe.frame = view.frame
        describe.textAlignment = .center
        describe.isEditable = false
        describe.isSelectable = false
        navigationController?.navigationBar.backgroundColor = .systemGray5
//        view.backgroundColor =
        navigationController?.navigationBar.prefersLargeTitles = false
        view.addSubview(describe)
        
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
