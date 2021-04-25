//
//  APIRouter.swift
//  TheMobibeDB-iOS
//
//  Created by Jorge Luis Rivera Ladino on 25/04/21.
//

import Foundation

enum APIRouter {
    
    case Movies([String: Any])
    
    private var method: HTTPMethod {
        switch self {
        case .Movies:
            return .GET
        }
    }
    
    private var path: String {
        switch self {
        case .Movies(let parameters):
            let page = parameters["page"] ?? ""
            let apiKey = "39c8af238a6bdfbe33629010bb758d12"
            return "list/\(page)?api_key=\(apiKey)"
        }
    }
    
    private var url: String {
        APIManagerConstants.endpoint
    }
    
    private var urlRequest: URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return urlRequest
    }
    
    private var nsUrlRequest: URLRequest? {
        guard let nsUrl = NSURL(string: self.url + path) else {
            return nil
        }
        var urlRequest = URLRequest(url: nsUrl as URL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return urlRequest
    }
    
    var request: URLRequest? {
        switch self {
        case .Movies:
            return nsUrlRequest
        }
    }
    
}

