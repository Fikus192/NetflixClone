//
//  User.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 25/07/2024.
//

import Foundation

internal struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

internal struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
}
