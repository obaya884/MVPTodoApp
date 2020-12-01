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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var newItemTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        presenter.viewDidLoad()
    }
    
    @IBAction func tappedAddButton() {
        if !newItemTextField.text!.isEmpty {
            presenter.addNewItem(itemContent: newItemTextField.text!)
            newItemTextField.text = ""
        }
    }

}

extension TodoListViewController: TodoListPresenterOutput {
    func updateItems() {
        tableView.reloadData()
    }
    
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = presenter.item(forRow: indexPath.row)

        return cell
    }
    
}
