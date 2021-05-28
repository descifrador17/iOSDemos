//
//  ViewController.swift
//  SqliteDemo
//
//  Created by Dayal, Utkarsh on 29/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var db:DBHelper = DBHelper()
       
    var persons:[Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
               
        db.insert(id: 1, name: "Utkarsh", age: 20)
        db.insert(id: 2, name: "Shaun", age: 27)
        db.insert(id: 3, name: "Andrew", age: 44)
        db.insert(id: 4, name: "Joey", age: 30)
        db.insert(id: 5, name: "Ronaldo", age: 34)
               
        persons = db.read()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
      {
          return persons.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
      {
          let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
          cell.textLabel?.text = "Name: " + persons[indexPath.row].name + ", " + "Age: " + String(persons[indexPath.row].age)
          
          return cell
      }


}

