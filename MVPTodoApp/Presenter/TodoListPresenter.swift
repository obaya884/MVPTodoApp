//
//  TodoListPresenter.swift
//  MVPTodoApp
//
//  Created by 大林拓実 on 2020/12/01.
//

import Foundation

protocol TodoListPresenterInput {
    var numberOfItems: Int{get}
    func item(forRow row: Int) -> String
    func viewDidLoad()
}

protocol TodoListPresenterOutput: AnyObject {
    func updateItems()
}

final class TodoListPresenter: TodoListPresenterInput {
    
    private(set) var items: [String] = []
    
    private weak var view: TodoListPresenterOutput!
    private var model: TodoModelInput
    
    init(view: TodoListPresenterOutput, model: TodoModelInput) {
        self.view = view
        self.model = model
    }
    
    var numberOfItems: Int {
        return items.count
    }
    
    func item(forRow row: Int) -> String {
        return ""
    }
    
    func viewDidLoad() {
        
    }
    
}
