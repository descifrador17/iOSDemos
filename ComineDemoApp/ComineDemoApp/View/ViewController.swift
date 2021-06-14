//
//  ViewController.swift
//  ComineDemoApp
//
//  Created by Dayal, Utkarsh on 14/06/21.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    
    private var usersSubscriber: AnyCancellable?
    
    private var users = [User](){
        didSet{
            userTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        userTableView.tableFooterView = UIView()
        userTableView.delegate = self
        userTableView.dataSource = self
        fetchUsers()
        
    }
    
    func fetchUsers(){
        usersSubscriber = DataManager().usersPublisher.sink(receiveCompletion: { _ in}, receiveValue: {data in
            self.users = data
        })
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = self.users[indexPath.item].name
        cell.detailTextLabel?.text = self.users[indexPath.item].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clicked")
    }
}

