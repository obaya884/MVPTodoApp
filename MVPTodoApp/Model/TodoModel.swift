//
//  TodoModel.swift
//  MVPTodoApp
//
//  Created by 大林拓実 on 2020/12/01.
//

import Foundation

protocol TodoModelInput {
    func fetchItems() -> [String]
}

final class TodoModel: TodoModelInput {
    func fetchItems() -> [String] {
        return []
    }
    
    
}
