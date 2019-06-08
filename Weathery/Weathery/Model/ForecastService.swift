//
//  ForecastService.swift
//  Weathery
//
//  Created by Rajdeep Singh Golan on 28/05/19.
//  Copyright © 2019 Rajdeep Singh Golan. All rights reserved.
//

import Foundation
class ForecastService{
    let forecastAPIkey: String
    let forecastBaseURl : URL?
    
    //forecastBaseUrl/forecastAPI/Latitude,Longitude
    init(APIKey : String) {
        self.forecastAPIkey = APIKey
        forecastBaseURl = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    func getForecast(latitude : Double , longitude : Double , completion: @escaping (CurrentWeather?) -> Void){
        if let forecastURL = URL(string: "\(forecastBaseURl!)/\(latitude),\(longitude)"){
            let networkProcessor = NetworkProcessor(url: forecastURL)
            networkProcessor.downloadJSONFromURL { (jsonDictionary) in
                //Parsing JSONDICTIONARY to Weather Object
                if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String:Any]{
                    let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                    completion(currentWeather)
                }else{
                    completion(nil)
                }
            }
        }
    }
}
