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
    let brand: String
    let weight: Int
    let warrantyInformation, shippingInformation: String
    let images: [String]
    let thumbnail: String
}
