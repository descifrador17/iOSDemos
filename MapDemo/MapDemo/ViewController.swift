//
//  ViewController.swift
//  MapDemo
//
//  Created by Dayal, Utkarsh on 08/04/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        <#code#>
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        <#code#>
    }
    
}

