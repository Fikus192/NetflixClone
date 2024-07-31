//
//  HomeViewModel.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 30/07/2024.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var filters = FilterModel.mockArray
    @Published var selectedFilter: FilterModel? = nil
    
    @ViewBuilder
    internal func header() -> some View {
        HStack(spacing: 0) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            
            HStack(spacing: 16) {
                Button {
                    // share to TV
                } label: {
                    Image(systemName: "tv.badge.wifi")
                }
                
                Button {
                    // filter items
                } label: {
                    Image(systemName: "magnifyingglass")
                }
            }
            .font(.title2)
        }
    }
}
