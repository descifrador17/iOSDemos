 //
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Dayal, Utkarsh on 27/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var personTable: UITableView!
    
    //Managed Object Context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items: [Person]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        personTable.delegate = self
        personTable.dataSource = self
        
        //Get items from CoreData
        fetchPeople()
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Person", message: "What is their Name?", preferredStyle: .alert)
        alert.addTextField()

        let submitButton = UIAlertAction(title: "Add", style: .default){ action in
            let textField = alert.textFields![0]
            
            //create a person object
            
            //Save the Data
            
            //Re-fetch the Data
            
        }
        
        alert.addAction(submitButton)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func fetchPeople(){
        do{
            self.items = try context.fetch(Person.fetchRequest())
            DispatchQueue.main.async {
                self.personTable.reloadData()
            }
            
        }
        catch{
            
        }
    }
}
 
 
 extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = personTable.dequeueReusableCell(withIdentifier: "PersonCell",for: indexPath)
        
        //Get person from array and set the label
        let person = self.items![indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = self.items![indexPath.row]
        
        let alert = UIAlertController(title: "Edit Person", message: "Edit name", preferredStyle: .alert)
        alert.addTextField()
        
        let textField = alert.textFields![0]
        textField.text = person.name
        
//        let saveButton = UIAlertAction(title: "Save", style: .default){ action in
//
//        }
    }
    
    
 }

