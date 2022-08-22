//
//  TTPEndpoint.swift
//  TaskTaskProject
//
//  Created by Eris Ramirez on 21/08/22.
//

import Foundation

// - base Endpoint handler Struct
struct TTPEndpoint {
    var endpoint: TTPAppEndpoint
    var queryItems: [URLQueryItem] = []
}

extension TTPEndpoint {
    static func tasks(with id:String) -> Self {
        let queryItem = URLQueryItem(name: "tenantId", value: id)
        return TTPEndpoint(endpoint: .getTasks, queryItems: [queryItem])
    }
}

// - Endpoint extension to compute a url var to define the URLComponetns
extension TTPEndpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = TTPConstants.UrlConstants.scheme
        components.host = TTPConstants.UrlConstants.host
        components.path = endpoint.rawValue()
        components.queryItems = queryItems
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        return url
    }
}
