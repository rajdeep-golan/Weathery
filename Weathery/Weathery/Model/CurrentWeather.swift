//
//  CurrentWeather.swift
//  Weathery
//
//  Created by Rajdeep Singh Golan on 28/05/19.
//  Copyright © 2019 Rajdeep Singh Golan. All rights reserved.
//

import Foundation
class CurrentWeather{
    let temperature : Int?
    let humidity : Int?
    let precipProbablity: Int?
    let summary : String?
    struct WeatherKey{
        static let temperature="temperature"
        static let humidity="humidity"
        static let precipProbablity = "precipProbablity"
        static let summary = "summary"
    }
    
    init(weatherDictionary : [String : Any]){
        temperature=weatherDictionary[WeatherKey.temperature] as? Int
        if let humidityDouble=weatherDictionary[WeatherKey.humidity] as? Double{
            humidity=Int(humidityDouble) * 100; // As a percentage
        }
        else{
            humidity=nil
        }
        if let precipProbablityDouble=weatherDictionary[WeatherKey.precipProbablity] as? Double{
            precipProbablity=Int(precipProbablityDouble) * 100; // As a percentage
        }
        else{
            precipProbablity=nil
        }
        summary=weatherDictionary[WeatherKey.summary] as? String
    }
}
