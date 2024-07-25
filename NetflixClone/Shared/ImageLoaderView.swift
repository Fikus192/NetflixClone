//
//  ImageLoaderView.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 25/07/2024.
//

import SwiftUI
import SDWebImageSwiftUI

internal struct ImageLoaderView: View {
    
    internal var urlString: String = Constants.randomImage
    internal var resizingMode: ContentMode = .fill
    
    internal var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay(
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            )
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
}
