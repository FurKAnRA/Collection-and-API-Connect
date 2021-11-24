//
//  MapViewController.swift
//  Appcent201Egitim
//
//  Created by Furkan Kara on 24.11.2021.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {
    let manager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.getLocation()
        }

     
    }


    func getLocation(){
        
        
            manager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            manager.delegate = self
            manager.startUpdatingLocation()
        }
            
    }

}


extension MapViewController : CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        
        guard let lastLocation = locations.last else{return}
            
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = CLLocationCoordinate2D(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude )
        
        mapView.addAnnotation(annotation)
        
        
        let region =   MKCoordinateRegion.init(center: lastLocation.coordinate, latitudinalMeters: 1500, longitudinalMeters: 1500)
        
        mapView.setRegion(region, animated: true)
            
            
        
        
        
            
        
        
        
    }
    
}
