//
//  Person.swift
//  SqliteDemo
//
//  Created by Dayal, Utkarsh on 30/04/21.
//

import Foundation

class Person{
    
    var name: String = ""
    var age: Int = 0
    var id: Int = 0
    
    init(name: String, age: Int, id: Int) {
        self.name = name
        self.age = age
        self.id = id
    }
}
