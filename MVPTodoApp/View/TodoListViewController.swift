//
//  ViewController.swift
//  MVPTodoApp
//
//  Created by 大林拓実 on 2020/12/01.
//

import UIKit

class TodoListViewController: UIViewController {
    
    private var presenter: TodoListPresenterInput!
    func inject (presenter: TodoListPresenterInput) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension TodoListViewController: TodoListPresenterOutput {
    func updateItems() {
        
    }
    
}

