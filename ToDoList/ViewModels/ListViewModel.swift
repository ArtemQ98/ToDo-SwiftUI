//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Артём Курочкин on 24.11.2025.
//

import Foundation
import Combine
import SwiftUI

class ListViewModel : ObservableObject{
    
    let itemsKey:String = "items_list"
    
    @Published var items:[ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    
    init() {
        getItems()
    }
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.items = savedItem
    }
    
    func deleteItem(indexOffset: IndexSet){
        items.remove(atOffsets: indexOffset)
    }
    func moveItem(start: IndexSet, end: Int){
        items.move(fromOffsets: start, toOffset: end)
    }
    func addItem(title: String){
        let newItem = ItemModel(title: title, isComplete: false)
        items.append(newItem)
    }
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems(){
        if let encoderData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encoderData, forKey: itemsKey)
        }
    }
}
