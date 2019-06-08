//
//  AppDelegate.swift
//  Weathery
//
//  Created by Rajdeep Singh Golan on 28/05/19.
//  Copyright © 2019 Rajdeep Singh Golan. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //Testing of receiving  Json 
//        let url = URL(string : "https://api.darksky.net/forecast/510b58df9c42cebdd008ad266769e69c/37.8267,-122.4233")!
//        let networkProcessor = NetworkProcessor(url: url)
//        networkProcessor.downloadJSONFromURL { (jsonDictionary) in
//            print(jsonDictionary)
//        }
        
        //Trying out for Los Angeles
//        let forecastService = ForecastService(APIKey: "510b58df9c42cebdd008ad266769e69c")
//        forecastService.getForecast(latitude: 37.8267, longitude: -122.4233) { (currentWeather) in
//            print(currentWeather)
//        }
        return true
    }

}
