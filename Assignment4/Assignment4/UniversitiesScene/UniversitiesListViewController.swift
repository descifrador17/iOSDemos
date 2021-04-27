//
//  UniversitiesListViewController.swift
//  Assignment4
//
//  Created by Dayal, Utkarsh on 18/04/21.
//

import UIKit

class UniversitiesListViewController: UIViewController {
    @IBOutlet weak var universitiesTable: UITableView!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var universitiesDataSource = UniversitiesDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        universitiesTable.delegate = self
        universitiesTable.dataSource = universitiesDataSource
    
        fetchData()
    }
    
    private func fetchData(){
        NetworkingApi().getUniversitiesList(completionHandler: {[weak self] result in
            guard let strongSelf = self else {return}
            strongSelf.universitiesDataSource.data = result
            strongSelf.loadingIndicator.stopAnimating()
            strongSelf.universitiesTable.reloadData()
            strongSelf.universitiesTable.isHidden = false
        })
    }

}

extension UniversitiesListViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Clicked", message: "\((tableView.cellForRow(at: indexPath)?.textLabel!.text)!.capitalized)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
