//
//  ViewController.swift
//  userSpeed
//
//  Created by Charlotte Voskuilen on 08-01-17.
//  Copyright © 2017 Alpaca. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var userMeter: UILabel!
    
    let manager = CLLocationManager()
    
    func locationManager (_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        //Gives only 1 number after the comma and multiplies the locations speed by 3.6
        let numberRound = String(format: " %.1f", location.speed * 3.6)
        
        //Shows speed on screen in km/h
        userMeter.text = "\(numberRound) km/h"
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Gives an accurate location by configuring location manager
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        //Makes sure your phones screen won't fall asleep
        UIApplication.shared.isIdleTimerDisabled = true
        
        //Did find users location
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.first {
                print("Found user's location: \(location)")
                
            }
        }

        //Failed to find the users location
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Failed to find user's location: \(error.localizedDescription)")
        
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
