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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        theMapView.isScrollEnabled = false
        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let latitude:CLLocationDegrees = 25.0443651
            let longitude:CLLocationDegrees = 121.5133274
            let location:CLLocationCoordinate2D =
                CLLocationCoordinate2DMake(latitude, longitude)
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
    
    
    
}

