//
//  MapViewController.swift
//  Momentum Fitness
//
//  Created by Greg Knott on 2021-12-09.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var titleLabel: UILabel!
    var pointAnnotation: MKPointAnnotation?
    var pinAnnotationView: MKPinAnnotationView?
    @IBOutlet var tableView: UITableView!
    
    var results: [MKMapItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.dataSource = self
        searchFor(query: "Gym")
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapViewCell", for: indexPath) as! MapViewCell
        
        cell.mapItemName.text = self.results[indexPath.row].name
        
        return cell
    }
    
    @IBAction func changeSearch(_ sender: UISegmentedControl) {
        
        if (sender.selectedSegmentIndex == 0){
            titleLabel.text = "Gyms Near You"
            searchFor(query: "Gym")
        } else if (sender.selectedSegmentIndex == 1){
            searchFor(query: "Supplement Store")
            titleLabel.text = "Supplement Stores Near You"
        }
        
        tableView.reloadData()
    }
    
    func searchFor(query: String) {
        let localSearchRequest = MKLocalSearch.Request()
        var localSearchResponse = MKLocalSearch.Response()
        localSearchRequest.naturalLanguageQuery = query
        let localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start { (localSearchResponse, Error) in
            if localSearchResponse == nil{
                let alertController = UIAlertController(title: nil, message: "No Place Found", preferredStyle: UIAlertController.Style.alert)
                
                alertController.addAction(UIAlertAction(title: "Error", style: UIAlertAction.Style.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            } else {
                
                //Create array with top 5 search results
                self.results = Array(localSearchResponse!.mapItems[0 ... 4])
            
                self.addPinToMap(mapItem: self.results[0])
            }
        }
    }
    
    func addPinToMap(mapItem: MKMapItem){
        
        //Remove any previous pins
        self.mapView.removeAnnotations(self.mapView.annotations)
        
        //Make a pin with the information
        self.pointAnnotation = MKPointAnnotation()
        
        //Set pin display text
        self.pointAnnotation?.title = mapItem.name
        
        //Set pin coordinates to search response coordinates
        self.pointAnnotation?.coordinate = CLLocationCoordinate2D(latitude: (mapItem.placemark.location?.coordinate.latitude)!, longitude: (mapItem.placemark.location?.coordinate.longitude)!)

        mapItem.placemark.location?.coordinate.latitude
        
        self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
        
        
        self.mapView.centerCoordinate = self.pointAnnotation?.coordinate ?? CLLocationCoordinate2D()
    
        //Add pin to map
        self.mapView.addAnnotation(self.pinAnnotationView?.annotation! as! MKAnnotation)
    }
}
