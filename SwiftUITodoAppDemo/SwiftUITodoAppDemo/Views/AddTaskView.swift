//
//  AddTaskView.swift
//  SwiftUITodoAppDemo
//
//  Created by Dayal, Utkarsh on 27/05/21.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var newTaskName: String = ""
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10, content: {
                
                TextField("Enter Task", text: $newTaskName)
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(10)
                
                Button(action: {
                    addButtonPressed()
                }, label: {
                    Spacer()
                    Text("ADD")
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                })
                .padding()
                .foregroundColor(.white)
                .background((newTaskName.count<3) ? Color.gray : Color.blue)
                .cornerRadius(10)
                .disabled((newTaskName.count<3) ? true : false)
                
            })
            .padding()
        }
        .navigationTitle("Add New Task")
    }
    
    func addButtonPressed(){
        listViewModel.addItem(taskName: newTaskName)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddTaskView()
        }
        .environmentObject(ListViewModel())
    }
}
