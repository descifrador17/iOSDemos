//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Dayal, Utkarsh on 05/04/21.
//

let testData = ["Lorem Ipsum 01","Lorem Ipsum 02","Lorem Ipsum 03","Lorem Ipsum 04","Lorem Ipsum 05",
                "Lorem Ipsum 06","Lorem Ipsum 07","Lorem Ipsum 08","Lorem Ipsum 09","Lorem Ipsum 10",
                "Lorem Ipsum 11","Lorem Ipsum 12","Lorem Ipsum 13",]

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension ViewController:UITableViewDelegate{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TApped")
    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath)

        cell.textLabel?.text = testData[indexPath.row]
        return cell
    }
}





