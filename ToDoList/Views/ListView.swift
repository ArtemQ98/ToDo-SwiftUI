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
                        HStack{
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear){
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                    

                }
                .listStyle(.insetGrouped)
            }
        }
        .navigationTitle("Список задач 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Добавить", destination: AddView()))
//        .toolbar{
//            ToolbarItem(placement: .navigationBarLeading) {
//                EditButton()
//            }
//            
//            ToolbarItem(placement: .navigationBarTrailing) {
//                NavigationLink("Добавить", destination: AddView())
//            }
//        }
        
        
        
//        .navigationBarItems(
//            leading: EditButton().navigationTitle("Редактировать"),
//            trailing:
//                NavigationLink("Добавить", destination: AddView())
//            )
    }
}



#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel())
    
}
