//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by Lukas Sestic on 28/02/2018.
//  Copyright © 2018 Lukas Sestic. All rights reserved.
//

import Foundation

struct PhotoInfoController {
    
    func fetchphotoInfo(completion: @escaping (PhotoInfo?) -> Void ) {
        let baseURL = URL(string:"https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY" )!
        let query: [String:String] = ["api_key":"DEMO_KEY"]
        let finalURL = baseURL.withQueries(query)!
        
        let task = URLSession.shared.dataTask(with: finalURL) { (data, response, error) in
        if  let data = data,
            let rawJSON = try? JSONSerialization.jsonObject(with: data),
            let json = rawJSON as? [String: String],
            let photoInfo = PhotoInfo(json: json) {
            print(photoInfo.title)
            completion(photoInfo)
        }
        else {
            print("Either no data was returned, or data was not serialized.")
            completion(nil)
        }
    }
    task.resume()
    }
    
}
