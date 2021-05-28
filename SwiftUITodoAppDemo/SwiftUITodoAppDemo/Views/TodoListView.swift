//
//  TodoListView.swift
//  SwiftUITodoAppDemo
//
//  Created by Dayal, Utkarsh on 27/05/21.
//

import SwiftUI
import UIKit

struct TodoListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        //List
        List{
            ForEach(listViewModel.items){ item in
                TodoListItemView(task: item)
                    .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    .onTapGesture{
                        withAnimation(.linear){
                            listViewModel.completeTask(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deletetask)
            .onMove(perform: listViewModel.moveItem)
            
        }
        .navigationTitle("My Tasks ✍️")
        .listStyle(PlainListStyle())
        .padding(.vertical)
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddTaskView())
        )
    }
    
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TodoListView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(ListViewModel())
    }
}
