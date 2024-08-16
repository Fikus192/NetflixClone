//
//  MovieDetailsView.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 09/08/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    
    @StateObject private var vm = HomeViewModel()
    
    var product: Product = .mock
    
    @State private var progress: Double = 0.2
    @State private var isMyList: Bool = false
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.theme.customBlack
                .ignoresSafeArea()
            Color.theme.customDarkGray
                .opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                DetailsHeaderView(
                    imageName: product.firstImage,
                    progress: progress,
                    onAirplayPressed: {
                        
                    },
                    onXMarkPressed: {
                        
                    }
                )
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        DetailsProductView(
                            title: product.title,
                            isNew: true,
                            yearReleased: "2024",
                            seasonCount: 3,
                            hasClosedCaptions: true,
                            isTopTen: 2,
                            descriptionText: product.description,
                            castText: "Cast: Matheo",
                            onPlayPressed: {
                                
                            },
                            onDownloadPressed: {
                                
                            }
                        )
                        
                        HStack(spacing: 32) {
                            MyListButton(isMyList: isMyList) {
                                isMyList.toggle()
                            }
                            
                            RateButton { selection in
                                // do something with selection
                            }
                            
                            ShareButton()
                        }
                        .padding(.leading, 32)
                        
                        VStack(alignment: .leading) {
                            Text("More Like This")
                                .font(.headline)
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 3),
                                      alignment: .center,
                                      spacing: 8,
                                      pinnedViews: [],
                                      content: {
                                ForEach(products) { product in
                                    MovieRowView(
                                        imageName: product.firstImage,
                                        title: product.title,
                                        isRecentlyAdded: product.recentlyAdded,
                                        topTenRanking: nil
                                    )
                                }
                            })
                        }
                        .foregroundStyle(Color.theme.customWhite)
                    }
                    .padding(8)
                }
                .scrollIndicators(.hidden)
            }
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        guard products.isEmpty else { return }
        
        do {
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    MovieDetailsView()
}
