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
        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let latitude:CLLocationDegrees = 25.0444032
            let longitude:CLLocationDegrees = 121.5141468
            let location:CLLocationCoordinate2D =
                CLLocationCoordinate2DMake(latitude, longitude)
            let xScale:CLLocationDegrees = 0.001
            let yScale:CLLocationDegrees = 0.001
            let span:MKCoordinateSpan =
                MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
            let region:MKCoordinateRegion =
                MKCoordinateRegion.init(center: location, span: span)
            self.theMapView.setRegion(region, animated: true)
        }
    }
    
    
}

