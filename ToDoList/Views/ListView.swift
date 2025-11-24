//
//  ListView.swift
//  ToDoList
//
//  Created by Артём Курочкин on 24.11.2025.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView()
            }
            else{
                List {
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        .navigationTitle("Список задач 📝")
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Добавить", destination: AddView())
            }
        }
        .navigationViewStyle(.stack)
//        .navigationBarItems(
//            leading: EditButton().navigationTitle("Редактировать"),
//            trailing:
//                NavigationLink("Добавить", destination: AddView())
//            )
    }
    
    
    
}

#Preview {
    NavigationStack{
        ListView()
    }
    .environmentObject(ListViewModel())
    
}
