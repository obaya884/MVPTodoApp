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
        tableView.delegate = self
        
        newItemTextField.delegate = self
        
        presenter.viewDidLoad()
    }
    
    @IBAction func tappedAddButton() {
        if !newItemTextField.text!.isEmpty {
            presenter.addNewItem(itemContent: newItemTextField.text!)
            newItemTextField.text = ""
            newItemTextField.resignFirstResponder()
        }
    }

}

extension TodoListViewController: TodoListPresenterOutput {
    func updateItems() {
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
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

extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.didEditingDelete(at: indexPath)
        }
    }
    
}

extension TodoListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
