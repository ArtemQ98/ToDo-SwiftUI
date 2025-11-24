//
//  ItemModel.swift
//  ToDoList
//
//  Created by Артём Курочкин on 24.11.2025.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isComplete: Bool
    
    init(id: String = UUID().uuidString, title: String, isComplete: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.isComplete = isComplete
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel(id: self.id, title: self.title, isComplete: !self.isComplete)
    }
}
