//
//  NetworkService.swift
//  ThinkD
//
//  Created by William Lyons on 2025-03-04.
//

import Foundation

enum EndPoints {
    static let procuctsEndpoint = "https://td-ios-coding-challenge.s3.amazonaws.com/product_data/products.json"
    
    static let productsMalformedEndpoint = "https://td-ios-coding-challenge.s3.amazonaws.com/product_data/products_malformed.json"
    
    static let productsEmptyEndpoint = "https://td-ios-coding-challenge.s3.amazonaws.com/product_data/products_empty.json"
}

enum NetworkError: Error {
    case badURL
    case malformedJSON
}

class NetworkService {
    
    private init() { }
    
    static let sharedInstance = NetworkService()
    
    enum AppError: Error {
        case badURL
        case malformedJSON
    }
    
    func requestProducts(endPoint: String? = EndPoints.procuctsEndpoint) async throws -> [Product] {
        
        guard let endPoint = endPoint, let url = URL(string: endPoint) else {
            throw NetworkError.badURL
        }
        
        var products: [Product] = []
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            do {
                let root = try decoder.decode(Root.self, from: data)
                products = root.products
            } catch {
                throw NetworkError.malformedJSON
            }
        }
        
        return products
    }
    
}
