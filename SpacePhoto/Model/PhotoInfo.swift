//
//  PhotoInfo.swift
//  SpacePhoto
//
//  Created by Lukas Sestic on 28/02/2018.
//  Copyright © 2018 Lukas Sestic. All rights reserved.
//

import Foundation

struct PhotoInfo {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    init?(json: [String: Any]) {
        guard let title = json["title"] as? String,
            let description = json["explanation"] as? String,
            let urlString = json["url"] as? String,
            let url = URL(string: urlString) else { return nil }
        
        self.title = title
        self.description = description
        self.url = url
        self.copyright = json["copyright"] as? String
    }
}
