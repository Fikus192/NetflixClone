//
//  ShareButton.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 16/08/2024.
//

import SwiftUI

internal struct ShareButton: View {
    
    var url: String = "https://www.netflix.com"
    
    @ViewBuilder
    internal var body: some View {
        if let url = URL(string: url) {
            ShareLink(item: url) {
                VStack(spacing: 8) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                    
                    Text("Share")
                        .font(.caption)
                        .foregroundStyle(Color.theme.customLightGray)
                }
                .foregroundStyle(Color.theme.customWhite)
                .padding(8)
                .background(Color.theme.customBlack.opacity(0.001))
            }
        }
    }
}

#Preview {
    ZStack {
        Color.theme.customBlack
            .ignoresSafeArea()
        
        ShareButton()
    }
}
