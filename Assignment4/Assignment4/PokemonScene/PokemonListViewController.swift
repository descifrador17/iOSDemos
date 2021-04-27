//
//  PokemonListViewController.swift
//  Assignment4
//
//  Created by Dayal, Utkarsh on 18/04/21.
//

import UIKit

class PokemonListViewController: UIViewController {
    
    @IBOutlet weak var pokemonsTable: UITableView!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var pokemonDataSource = PokemonsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonsTable.delegate = self
        pokemonsTable.dataSource = pokemonDataSource
        
        fetchData()
    }
    
    private func fetchData(){
        NetworkingApi().getPokemonsList(completionHandler: {[weak self] result in
            guard let strongSelf = self else{ return }
            strongSelf.pokemonDataSource.data = result.results
            strongSelf.loadingIndicator.stopAnimating()
            strongSelf.pokemonsTable.reloadData()
            strongSelf.pokemonsTable.isHidden = false
        })
    }

}

extension PokemonListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Clicked", message: "\((tableView.cellForRow(at: indexPath)?.textLabel!.text)!.capitalized)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
