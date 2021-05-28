//
//  taskModel.swift
//  SwiftUITodoAppDemo
//
//  Created by Dayal, Utkarsh on 28/05/21.
//

import Foundation

struct TaskModel: Identifiable, Codable {
    let id: String = UUID().uuidString
    var title: String
    var isCompleted: Bool
}
