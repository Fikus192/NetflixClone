//
//  FilterModel.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 30/07/2024.
//

import SwiftUI

internal struct FilterModel: Hashable, Equatable {
    let title: String
    let isDropdown: Bool
    
    static var mockArray: [FilterModel] {
        
        [
            FilterModel(title: "TV Shows", isDropdown: false),
            FilterModel(title: "Movies", isDropdown: false),
            FilterModel(title: "Categories", isDropdown: true)
        ]
    }
}
