//
//  HeroView.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 02/08/2024.
//

import SwiftUI

struct HeroView: View {
    
    var imageName: String = Constants.randomImage
    var isNetflixFilm: Bool = true
    var title: String = "Players"
    var categories: [String] = ["Raunchy", "Romantic", "Comedy"]
    var onBackgroundPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    var onMyListPressed: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
            
            VStack(spacing: 16) {
                VStack(spacing: 0) {
                    if isNetflixFilm {
                        HStack(spacing: 8) {
                            Text("N")
                                .foregroundStyle(Color.theme.customRed)
                                .font(.largeTitle)
                                .fontWeight(.black)
                            
                            Text("FILM")
                                .kerning(3)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.theme.customLightGray)
                        }
                    }
                    
                    Text(title)
                        .font(.system(size: 50, weight: .medium, design: .serif))
                }
                
                HStack(spacing: 8) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                            .font(.callout)
                        
                        if category != categories.last {
                            Circle()
                                .frame(width: 4, height: 4)
                        }
                    }
                }
                
                HStack(spacing: 16) {
                    HStack {
                        Button {
                            onPlayPressed?()
                        } label: {
                            Image(systemName: "play.fill")
                            Text("Play")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .foregroundStyle(Color.theme.customDarkGray)
                        .background(Color.theme.customWhite)
                        .cornerRadius(4)
                    }
                    
                    HStack {
                        Button {
                            onMyListPressed?()
                        } label: {
                            Image(systemName: "plus")
                            Text("My List")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .foregroundStyle(Color.theme.customWhite)
                        .background(Color.theme.customDarkGray)
                        .cornerRadius(4)
                    }
                }
                .font(.callout)
                .fontWeight(.medium)
            }
            .padding(24)
            .background(
                LinearGradient(
                    colors: [
                        Color.theme.customBlack.opacity(0),
                        Color.theme.customBlack.opacity(0.4),
                        Color.theme.customBlack.opacity(0.4),
                        Color.theme.customBlack.opacity(0.4)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .foregroundStyle(Color.theme.customWhite)
        .cornerRadius(10)
        .aspectRatio(0.8, contentMode: .fit)
        .onTapGesture {
            onBackgroundPressed?()
        }
    }
}

#Preview {
    HeroView()
        .padding(40)
}
