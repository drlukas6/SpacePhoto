//
//  URLHelpers.swift
//  SpacePhoto
//
//  Created by Lukas Sestic on 28/02/2018.
//  Copyright © 2018 Lukas Sestic. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self,
                                       resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
