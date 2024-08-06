//
//  Product.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 25/07/2024.
//

import Foundation

internal struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

internal struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let category: String
    let brand: String?
    let images: [String]
    let thumbnail: String
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    var _brand: String {
        brand ?? ""
    }
}

internal struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
