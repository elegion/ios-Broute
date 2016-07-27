# Broute

Managing route building in third-party maps application such as Apple Maps, Google Maps, Yandex Navigator, etc.

## Installation

With CocoaPods:

```
source 'https://github.com/elegion/ios-podspecs.git'
source 'https://github.com/CocoaPods/Specs.git'

pod 'Broute'
```

## Usage

MKMapView example

```swift
import UIKit
import MapKit
import Broute

class ViewController: UIViewController, MKMapViewDelegate {

    private let routeBuildingManager = ELNThirdPartyAppsRouteBuildingManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        routeBuildingManager.registerRouteBuilder(ELNAppleMapsRouteBuilder(), appNameLocKey: "appleMapsTitle")
        routeBuildingManager.registerRouteBuilder(ELNGoogleMapsRouteBuilder(), appNameLocKey: "googleMapsTitle")
        routeBuildingManager.registerRouteBuilder(ELNYandexNavigatorRouteBuilder(), appNameLocKey: "yandexNavigatorTitle")
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        if let annotation = view.annotation {
            processCoordinate(annotation.coordinate)
        }
    }
    
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
```

Remember about LSApplicationQueriesSchemes key (array) in plist.

## Requirements

iOS 8+

## Author

e-Legion

## License

Broute is available under the MIT license. See the LICENSE file for more info.

## TODOs

* Logo 🚲

* Add more building URL parameters
