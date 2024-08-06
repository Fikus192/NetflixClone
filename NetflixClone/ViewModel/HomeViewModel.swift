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
    @Published var fullHeaderSize: CGSize = .zero
    
    @Published var heroProduct: Product? = nil
    @Published var currentUser: User? = nil
    @Published private(set) var productRows: [ProductRow] = []
    
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
    
    internal func getData() async {
        guard productRows.isEmpty else { return }
        
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            let products = try await DatabaseHelper().getProducts()
            heroProduct = products.first
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0._brand }))
            for brand in allBrands {
                rows.append(ProductRow(title: brand.capitalized, products: products.shuffled()))
            }
            productRows = rows
        } catch {
            
        }
    }
}
