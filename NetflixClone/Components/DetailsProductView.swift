//
//  DetailsProductView.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 10/08/2024.
//

import SwiftUI

struct DetailsProductView: View {
    
    var title: String
    var isNew: Bool
    var yearReleased: String?
    var seasonCount: Int?
    var hasClosedCaptions: Bool
    var isTopTen: Int?
    var descriptionText: String?
    var castText: String?
    var onPlayPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 8) {
                if isNew {
                    Text("New")
                        .foregroundStyle(.green)
                }
                
                if let yearReleased {
                    Text(yearReleased)
                }
                
                if let seasonCount {
                    Text("\(seasonCount) Seasons")
                }
                
                if hasClosedCaptions {
                    Image(systemName: "captions.bubble")
                }
            }
            .foregroundStyle(Color.theme.customLightGray)
            
            if let isTopTen {
                HStack(spacing: 8) {
                    topTenIcon
                    
                    Text("#\(isTopTen) in TV Shows Today")
                        .font(.headline)
                }
            }
            
            VStack(spacing: 8) {
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
                        onDownloadPressed?()
                    } label: {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text("Download")
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
            
            Group {
                if let descriptionText {
                    Text(descriptionText)
                }
                
                if let castText {
                    Text(castText)
                        .foregroundStyle(Color.theme.customLightGray)
                }
            }
            .font(.callout)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
        }
        .foregroundStyle(Color.theme.customWhite)
    }
    
    private var topTenIcon: some View {
        Rectangle()
            .fill(Color.theme.customRed)
            .frame(width: 28, height: 28)
            .overlay(
                VStack(spacing: -4) {
                    Text("TOP")
                        .font(.system(size: 8))
                        .fontWeight(.bold)
                    Text("10")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                }
                .offset(y: 1)
            )
    }
}

#Preview {
    ZStack {
        Color.theme.customBlack
            .ignoresSafeArea()
        
        DetailsProductView(
            title: "Movie Title",
            isNew: true,
            yearReleased: "2024",
            seasonCount: 2,
            hasClosedCaptions: true,
            isTopTen: 6,
            descriptionText: "This is description text!",
            castText: "This is cast text!"
        )
    }
}
