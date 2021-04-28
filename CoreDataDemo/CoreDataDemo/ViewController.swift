 //
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Dayal, Utkarsh on 27/04/21.
//

import UIKit
import CoreData

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
        
        let alert = UIAlertController(title: "Add Person", message: "Fill the Details", preferredStyle: .alert)
        alert.addTextField{nameField in
            nameField.placeholder = "Enter Name"
        }
        alert.addTextField{ageField in
            ageField.placeholder = "Enter Age"
            ageField.keyboardType = .numberPad
        }
        alert.addTextField{genderField in
            genderField.placeholder = "Enter Gender"
        }
        let submitButton = UIAlertAction(title: "Add", style: .default){ action in
            let nameField = alert.textFields![0] as UITextField
            let ageField = alert.textFields![1] as UITextField
            let genderField = alert.textFields![2] as UITextField

            
            //create a person object
            let newPerson = Person(context: self.context)
            newPerson.name = nameField.text ?? "No name"
            newPerson.age = Int64(ageField.text ?? "0") ?? 0
            newPerson.gender = genderField.text ?? "Not Specified"
            
            //Save the Data
            do{
                try self.context.save()
            } catch {
                
            }
            //Re-fetch the Data
            self.fetchPeople()
        }
        
        alert.addAction(submitButton)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func fetchPeople(){
        do{
            let request = Person.fetchRequest() as NSFetchRequest<Person>
            
            let predicate = NSPredicate(format: "name CONTAINS[cd] 'Dayal'")
            
            let sort = NSSortDescriptor(key: "name", ascending: true)
            request.sortDescriptors = [sort]
            request.predicate = predicate
            
            self.items = try context.fetch(request)
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
        
        let alert = UIAlertController(title: "Edit Person", message: "Edit the details of \((person.name)!)", preferredStyle: .alert)
        alert.addTextField{nameField in
            nameField.text = person.name
        }
        alert.addTextField{ageField in
            ageField.text = String(person.age)
            ageField.keyboardType = .numberPad
        }
        alert.addTextField{genderField in
            genderField.text = person.gender
        }
            
        let saveButton = UIAlertAction(title: "Save", style: .default){ action in
            
            let nameField = alert.textFields![0]
            let ageField = alert.textFields![1]
            let genderField = alert.textFields![2]
            
            //Edit property  of person
            person.name = nameField.text ?? person.name
            person.age = Int64(ageField.text ?? String(person.age)) ?? person.age
            person.gender = genderField.text ?? person.gender
            
            //save the data
            do{
                try self.context.save()
            } catch {
                
            }
            
            //Re-fetch the Data
            self.fetchPeople()
        
        }
        alert.addAction(saveButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete"){ action, view, completionHandler in
            
            //Which person to remove
            let personToRemove = self.items![indexPath.row]
            //Remove the person
            self.context.delete(personToRemove)
            //Save the Data
            do{
               try self.context.save()
            } catch {
                
            }
            //Fetch the Data
            self.fetchPeople()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
 }

