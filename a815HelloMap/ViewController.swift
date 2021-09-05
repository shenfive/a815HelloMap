//
//  ViewController.swift
//  a815HelloMap
//
//  Created by 申潤五 on 2021/9/5.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var theMapView: MKMapView!
    
    var locationManager:CLLocationManager? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        theMapView.isScrollEnabled = false
        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let latitude:CLLocationDegrees = 25.0443651
//        let longitude:CLLocationDegrees = 121.5133274
//        let location:CLLocationCoordinate2D =
//            CLLocationCoordinate2DMake(latitude, longitude)
        
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        
        if let location = locationManager?.location?.coordinate{
            let xScale:CLLocationDegrees = 0.0001
            let yScale:CLLocationDegrees = 0.0001
            let span:MKCoordinateSpan =
                MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
            let region:MKCoordinateRegion =
                MKCoordinateRegion.init(center: location, span: span)
            self.theMapView.setRegion(region, animated: true)
            
            let theAnnotation = MKPointAnnotation()
            theAnnotation.coordinate = location
            theAnnotation.title = "譯智"
            theAnnotation.subtitle = "教育訓練中心"
            self.theMapView.addAnnotation(theAnnotation)
        }
        

        
            
//        }
    }
    
    
    @IBAction func setMapType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            theMapView.mapType = .standard
        case 1:
            theMapView.mapType = .satellite
        case 2:
            theMapView.mapType = .hybrid
        default:
            break
        }
        
        
        
        
    }
    
    
    @IBAction func longPressAction(_ sender: UILongPressGestureRecognizer) {
        print("long Press")
        let touchPoint = sender.location(in: theMapView)
        let location = theMapView.convert(touchPoint, toCoordinateFrom: theMapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "自選點"
        self.theMapView.addAnnotation(annotation)
        
    }
    
}

