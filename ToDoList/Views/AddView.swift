//
//  AddView.swift
//  ToDoList
//
//  Created by Артём Курочкин on 24.11.2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var item:String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Приготовить завтрак...", text: $item)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.primary.opacity(0.2))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Сохранить")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
                
        }
        .navigationTitle("Напишите задачу 🖊️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: item)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textIsAppropriate() -> Bool {
        if item.count < 3{
            alertTitle = "Ваш новый пункт должен быть не менее 3 символов🙊"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text("\(alertTitle)"))
    }
}

#Preview {
    
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}
