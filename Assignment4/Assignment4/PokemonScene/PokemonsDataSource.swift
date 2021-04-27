//
//  PokemonsDataSource.swift
//  Assignment4
//
//  Created by Dayal, Utkarsh on 19/04/21.
//

import UIKit

class PokemonsDataSource: NSObject, UITableViewDataSource{
    
    var data : [Pokemon]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = data else { return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name?.capitalized
        return cell
    }
    
    
}
