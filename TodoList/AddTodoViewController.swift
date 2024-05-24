//
//  AddTodoViewController.swift
//  TodoList
//
//  Created by wonyoul heo on 5/24/24.
//

import UIKit

class AddTodoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "New Todo"
        view.backgroundColor = .white
        
        let rightButton = UIBarButtonItem(barButtonSystemItem: .save,
                                          target: self,
                                          action: #selector(save))
        navigationItem.rightBarButtonItem = rightButton
        
        let leftButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                         target: self,
                                         action: #selector(cancel))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    
    @objc func save() {
        
    }
    
    @objc func cancel() {
        dismiss(animated: true)
    }
}
