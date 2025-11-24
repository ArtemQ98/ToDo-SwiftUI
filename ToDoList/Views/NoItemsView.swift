//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Артём Курочкин on 24.11.2025.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("Нет задач")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Вы продуктивный человек? Я думаю, вам нужно нажать кнопку добавить и дополнить свой список дел!")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(), label: {
                    Text("Добавить что-нибудь 🥳")
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        

                })
                .offset(y: animate ? -7 : 0)
                .scaleEffect(animate ? 1.05 : 1.0)
                .shadow(
                    color: Color.accentColor.opacity(0.4),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 30 : 10)
                    
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
    
}

#Preview {
    NavigationStack {
        NoItemsView()
            .navigationTitle("Title")
    }
}
