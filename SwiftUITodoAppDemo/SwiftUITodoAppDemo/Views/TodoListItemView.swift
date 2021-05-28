//
//  TodoListItem.swift
//  SwiftUITodoAppDemo
//
//  Created by Dayal, Utkarsh on 27/05/21.
//

import SwiftUI

struct TodoListItemView: View {
    //MARK: - Properties
    
    var task: TaskModel
    
    //MARK: - Body
    var body: some View {
        HStack{
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .font(.title)
                .foregroundColor( task.isCompleted ? .blue : .black)
            Text(task.title)
                .font(.system(size: 24, weight: .medium, design: .rounded))
                .foregroundColor( task.isCompleted ? .blue : .black)
            Spacer()
        }
        .padding(.vertical)
    }
}


