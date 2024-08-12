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
    
    let recentlyAdded: Bool = {
        return Int.random(in: 1...4) == 1
    }()
    
    static var mock: Product {
        Product(
            id: 997,
            title: "Example Title",
            description: "This is description of the title!",
            price: 169,
            discountPercentage: 10,
            rating: 4.0,
            stock: 35,
            category: "Electronic Devices",
            brand: "Apple",
            images: [Constants.randomImage, Constants.randomImage, Constants.randomImage],
            thumbnail: Constants.randomImage
        )
    }
}

internal struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
