//
//  TaskViewModel.swift
//  SwiftUITodoAppDemo
//
//  Created by Dayal, Utkarsh on 28/05/21.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var items: [TaskModel] = []{
        didSet{
            saveTasks()
        }
    }
    
    init() {
        getTasks()
    }
    
    func getTasks(){
        guard let data = UserDefaults.standard.data(forKey: "tasks_list"),
              let savedData = try? JSONDecoder().decode([TaskModel].self, from: data)
        else { return }
        
        self.items = savedData
        
    }
    
    func deletetask(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(taskName: String){
        let newTask = TaskModel(title: taskName, isCompleted: false)
        items.append(newTask)
    }
    
    func completeTask(item: TaskModel){
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index].isCompleted.toggle()
        }
    }
    
    func saveTasks(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: "tasks_list")
        }
    }
    
}
