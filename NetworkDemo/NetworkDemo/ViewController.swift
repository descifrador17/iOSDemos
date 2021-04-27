//
//  ViewController.swift
//  NetworkDemo
//
//  Created by Dayal, Utkarsh on 14/04/21.
//

//url - https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&formatted=0

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progress: UIActivityIndicatorView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NetworkingApi().getSunriseSunset(completion:{[weak self] result in
            guard let strongSelf = self else { return }
            strongSelf.progress.isHidden = true
            strongSelf.label.isHidden = false
            strongSelf.label.text = "sunrise : \(result.results.sunrise) \n\nsunset : \(result.results.sunset) \n\nsolar_noon : \(result.results.solar_noon) \n\nday_length : \(result.results.day_length) \n\ncivil_twilight_begin : \(result.results.civil_twilight_begin) \n\ncivil_twilight_end : \(result.results.civil_twilight_begin) \n\nnautical_twilight_begin : \(result.results.nautical_twilight_begin) \n\nnautical_twilight_end : \(result.results.nautical_twilight_end) \n\nastronomical_twilight_begin : \(result.results.astronomical_twilight_begin) \n\nastronomical_twilight_end : \(result.results.astronomical_twilight_end)"
            print(result)
        })
        
        
        
        
    }

}

