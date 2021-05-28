//
//  SwiftUITodoAppDemoApp.swift
//  SwiftUITodoAppDemo
//
//  Created by Dayal, Utkarsh on 27/05/21.
//

import SwiftUI

@main
struct SwiftUITodoAppDemoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                TodoListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
