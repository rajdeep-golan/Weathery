//
//  CurrentWeatherViewController.swift
//  Weathery
//
//  Created by Rajdeep Singh Golan on 28/05/19.
//  Copyright © 2019 Rajdeep Singh Golan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CurrentWeatherViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityTextLabel: UILabel!
    
    //Testing Data
    let forecastAPIKey="510b58df9c42cebdd008ad266769e69c"
    var coordinates:(lat:Double,lon:Double) = (37.8267,-122.4233)
    override func viewDidLoad() {
        super.viewDidLoad()
        let locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        var currentLocation: CLLocation!
   
        
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            
            currentLocation = locManager.location
            
        }

        coordinates.lat=(currentLocation?.coordinate.latitude ?? 37.8267)
        coordinates.lon=(currentLocation?.coordinate.longitude ?? -122.4233)
        let forecastService=ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(latitude: coordinates.lat, longitude: coordinates.lon) { (currentWeather) in
            if let currentWeather=currentWeather{
                //Getting back to main queue
                DispatchQueue.main.async {
                    if let temperature=currentWeather.temperature{
                        self.temperatureLabel.text="\(temperature)"
                    }else{
                        self.temperatureLabel.text="Summary : "+"\(currentWeather.summary ?? "NIL")"
                    }
                }
            }
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
