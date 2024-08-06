//
//  MovieRowView.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 06/08/2024.
//

import SwiftUI

struct MovieRowView: View {
    
    var width: CGFloat = 90
    var height: CGFloat = 140
    var imageName: String = Constants.randomImage
    var title: String? = "Movie Title"
    var isRecentlyAdded: Bool = false
    var topTenRanking: Int? = nil
    
    var body: some View {
        HStack(alignment: .bottom, spacing: -8) {
            if let topTenRanking {
                Text("\(topTenRanking)")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                    .offset(y: 20)
            }
            ZStack(alignment: .bottom) {
                ImageLoaderView(urlString: imageName)
                
                VStack(spacing: 0) {
                    if let title, let firstWord = title.components(separatedBy: " ").first {
                        Text(firstWord)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .lineLimit(1)
                    }
                    
                    Text("Recently Added")
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .padding(.bottom, 2)
                        .frame(maxWidth: .infinity)
                        .background(Color.theme.customRed)
                        .cornerRadius(2)
                        .offset(y: 2)
                        .lineLimit(1)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.1)
                        .padding(.horizontal, 8)
                        .opacity(isRecentlyAdded ? 1 : 0)
                }
                .padding(.top, 6)
                .background(
                    LinearGradient(
                        colors: [
                            Color.theme.customBlack.opacity(0),
                            Color.theme.customBlack.opacity(0.3),
                            Color.theme.customBlack.opacity(0.4),
                            Color.theme.customBlack.opacity(0.4)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .cornerRadius(4)
            .frame(width: width, height: height)
        }
        .foregroundStyle(Color.theme.customWhite)
    }
}

#Preview {
    ZStack {
        Color.theme.customBlack
            .ignoresSafeArea()
        
        ScrollView(.horizontal) {
            HStack {
                MovieRowView(isRecentlyAdded: true)
                MovieRowView(isRecentlyAdded: false)
                MovieRowView(isRecentlyAdded: true, topTenRanking: 1)
                MovieRowView(isRecentlyAdded: false, topTenRanking: 10)
            }
        }
        .scrollIndicators(.hidden)
    }
}
