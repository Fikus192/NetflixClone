//
//  HomeView.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 25/07/2024.
//

import SwiftUI

internal struct HomeView: View {
    
    @StateObject private var vm = HomeViewModel()
    
    internal var body: some View {
        ZStack(alignment: .top) {
            Color.theme.customBlack
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 8) {
                    Rectangle()
                        .opacity(0)
                        .frame(height: vm.fullHeaderSize.height)
                    
                    if let heroProduct = vm.heroProduct {
                        HeroView(
                            imageName: heroProduct.firstImage,
                            isNetflixFilm: true,
                            title: heroProduct.title,
                            categories: [heroProduct.category.capitalized, heroProduct._brand],
                            onBackgroundPressed: {
                                
                            },
                            onPlayPressed: {
                                
                            },
                            onMyListPressed: {
                                
                            }
                        )
                        .padding(24)
                    }
                    
                    ForEach(0..<20) { _ in
                        Rectangle()
                            .fill(Color.theme.customRed)
                            .frame(height: 200)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            VStack(spacing: 0) {
                vm.header()
                    .padding(.horizontal, 16)
                
                FilterBarView(
                    filters: vm.filters,
                    selectedFilter: vm.selectedFilter,
                    onFilterPressed: { newFilter in
                        vm.selectedFilter = newFilter
                    },
                    onXMarkPressed: {
                        vm.selectedFilter = nil
                    }
                )
                .padding(.top, 16)
            }
            .readingFrame { frame in
                vm.fullHeaderSize = frame.size
            }
        }
        .foregroundStyle(Color.theme.customWhite)
        .task {
            await vm.getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    HomeView()
}
