//
//  ViewController.swift
//  Example
//
//  Created by Георгий Касапиди on 27.07.16.
//  Copyright © 2016 ELN. All rights reserved.
//

import UIKit
import MapKit
import Broute

class ViewController: UIViewController, MKMapViewDelegate {
    
    // MARK: Properties
    
    private let routeBuildingManager = ELNThirdPartyAppsRouteBuildingManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        routeBuildingManager.registerRouteBuilder(ELNAppleMapsRouteBuilder(), appNameLocKey: "appleMapsTitle")
        routeBuildingManager.registerRouteBuilder(ELNGoogleMapsRouteBuilder(), appNameLocKey: "googleMapsTitle")
        routeBuildingManager.registerRouteBuilder(ELNYandexNavigatorRouteBuilder(), appNameLocKey: "yandexNavigatorTitle")
    }
    
    // MARK: Map view delegate
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        if let annotation = view.annotation {
            processCoordinate(annotation.coordinate)
        }
    }
    
    // MARK: Actions

    @IBAction func mapViewLongTapped(sender: UILongPressGestureRecognizer) {
        if sender.state != .Began {
            return
        }
        
        let coordinate = mapView.convertPoint(sender.locationInView(mapView), toCoordinateFromView: mapView)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        
        processCoordinate(coordinate)
    }
    
    // MARK: Private
    
    func processCoordinate(coordinate: CLLocationCoordinate2D) {
        let routeBuildingModels = routeBuildingManager.routeBuildingModelsForCoordinate(coordinate)
        
        let alert = UIAlertController(title: nil, message: "\(coordinate.latitude) \(coordinate.longitude)", preferredStyle: .ActionSheet)
        
        for routeBuildingModel in routeBuildingModels {
            alert.addAction(UIAlertAction(title: routeBuildingModel.appName, style: .Default) { _ in
                routeBuildingModel.openBuildingURL()
                })
        }
        
        alert.addAction(UIAlertAction(title: "Close", style: .Cancel, handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
    }
}
