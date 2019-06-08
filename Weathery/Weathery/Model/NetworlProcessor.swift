//
//  NetworlProcessor.swift
//  Weathery
//
//  Created by Rajdeep Singh Golan on 28/05/19.
//  Copyright © 2019 Rajdeep Singh Golan. All rights reserved.
//

import Foundation
class NetworkProcessor{
    lazy var configuration: URLSessionConfiguration=URLSessionConfiguration.default
    lazy var session: URLSession=URLSession(configuration: self.configuration)
    let url:URL
    init(url:URL) {
        self.url=url;
    }
    typealias JSONDictionaryHandler = (([String : Any ]?) -> Void)
    func downloadJSONFromURL(_ completion : @escaping JSONDictionaryHandler) {
        let request=URLRequest(url: self.url)
        let dataTask=session.dataTask(with: request) { (data, response, error) in
            if(error == nil){
                if let httpresponse = response as? HTTPURLResponse{
                    switch httpresponse.statusCode {
                    case 200 : //Successful Response
                        if let data = data{
                            do {
                            let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                                completion(jsonDictionary as? [String:Any])
                            }catch let error as NSError{
                                print("Error proocessing JSON data \(error.localizedDescription)")
                            }
                        }
                    default:print("HTTP Response Code : \(httpresponse.statusCode)")
                   
                        }
                } else{
                print("Error: \(error?.localizedDescription)")
            }
            }
    }
        dataTask.resume()
}
}
