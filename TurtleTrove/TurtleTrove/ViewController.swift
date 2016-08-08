//
//  ViewController.swift
//  TurtleTrove
//
//  Created by Victoria Barbessi on 8/6/16.
//  Copyright © 2016 Victoria Barbessi. All rights reserved.
//

import UIKit

import MapKit

import CoreLocation

import MessageUI


class ViewController: UIViewController, MKMapViewDelegate,
CLLocationManagerDelegate, MFMailComposeViewControllerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
        
    }
    
    
    
    @IBOutlet var imageViewCollection: [AnyObject]!
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Location Delegate Methods
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        self.mapView.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Errors: " + error.localizedDescription)
    }
    
    
    
    
    @IBAction func SetMap(sender: AnyObject)
    {
        switch sender.selectedSegmentIndex
            
        {
            
        case 1:
            
            mapView.mapType = MKMapType.SatelliteFlyover
            
            
            
        case 2:
            
            mapView.mapType = MKMapType.HybridFlyover
            
            
            
        default:
            
            mapView.mapType = MKMapType.Standard
            
            
        }
    }
    
    

    @IBAction func ReportTurtleButton(sender: AnyObject)
    {
        let mailComposeController = MFMailComposeViewController()
        mailComposeController.mailComposeDelegate = self
        mailComposeController.setToRecipients(["meredithvandevelde@gmail.com"])
        mailComposeController.setSubject("Testing 123")
        mailComposeController.setMessageBody("This is a test.", isHTML: false)
        
        
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeController, animated: true, completion: { ()
                
            })
            
        }
        
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?)
    {
        controller.dismissViewControllerAnimated(true) {
        }
        
    }

    
    
    @IBAction func FindNest(sender: AnyObject)
    {
        
    }
    
    
    
    
    

}

