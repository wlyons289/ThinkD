//
//  Product.swift
//  ThinkD
//
//  Created by William Lyons on 2025-03-04.
//

import Foundation


struct Product: Codable, Identifiable {
    let id = UUID()
    
    var uuid: String
    var product_name: String
    var brand_name: String
    
    var description: String?
    var image_url_small: String?
    var image_url_large: String?
    
    var product_category: String
    var hazard_rating: Int
    var hazard_rating_category: String // Enum
    
    private enum CodingKeys: String, CodingKey {
        case uuid
        case product_name
        case brand_name
        case description
        case image_url_small
        case image_url_large
        case product_category
        case hazard_rating
        case hazard_rating_category
        }
    
    func smallImageURL() -> URL? {
        guard let urlString = image_url_small else {
            return nil
        }
        return URL(string: urlString)
    }
    func largeImageURL() -> URL? {
        guard let urlString = image_url_large else {
            return nil
        }
        return URL(string: urlString)
    }

}


struct Root: Codable {
    let products: [Product]
}


