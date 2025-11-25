//
//  ListRowView.swift
//  ToDoList
//
//  Created by Артём Курочкин on 24.11.2025.
//

import SwiftUI

struct ListRowView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isComplete ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isComplete ? .green : .red)
                
            Text("\(item.title)")
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout){
    @Previewable var item1 = ItemModel(title: "First title", isComplete: false)
    ListRowView(item: item1).environmentObject(ListViewModel())

}
