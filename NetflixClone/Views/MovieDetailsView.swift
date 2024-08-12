//
//  MovieDetailsView.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 09/08/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var product: Product = .mock
    @State private var progress: Double = 0.2
    
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
                    VStack(spacing: 16) {
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
                    }
                    .padding(8)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    MovieDetailsView()
}
