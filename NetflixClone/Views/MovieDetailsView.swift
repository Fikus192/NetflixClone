//
//  MovieDetailsView.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 09/08/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var product: Product? = nil
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
                    imageName: product?.firstImage ?? Constants.randomImage,
                    progress: progress,
                    onAirplayPressed: {
                        
                    },
                    onXMarkPressed: {
                        
                    }
                )
                
                ScrollView(.vertical) {
                    
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    MovieDetailsView()
}
