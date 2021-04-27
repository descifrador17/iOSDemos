//
//  UniversitiesDataSource.swift
//  Assignment4
//
//  Created by Dayal, Utkarsh on 19/04/21.
//

import UIKit

class UniversitiesDataSource: NSObject, UITableViewDataSource{
    
    var data : [Universities]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data else { return  UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "universityCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        return cell
    }
    
    
}
