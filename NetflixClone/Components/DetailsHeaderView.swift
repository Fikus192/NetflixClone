//
//  DetailsHeaderView.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 09/08/2024.
//

import SwiftUI

struct DetailsHeaderView: View {
    
    var imageName: String = Constants.randomImage
    var progress: Double = 0.2
    var onAirplayPressed: (() -> Void)?
    var onXMarkPressed: (() -> Void)?

    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
            
            CustomProgressBar(
                selection: progress,
                range: 0...1,
                backgroundColor: Color.theme.customLightGray,
                foregroundColor: Color.theme.customRed,
                cornerRadius: 2,
                height: 4
            )
            .padding(.bottom, 4)
            .animation(.linear, value: progress)
            
            HStack(spacing: 8) {
                Button {
                    onAirplayPressed?()
                } label: {
                    Circle()
                        .fill(Color.theme.customDarkGray)
                        .overlay(
                            Image(systemName: "tv.badge.wifi")
                                .offset(y: 1)
                        )
                        .frame(width: 36, height: 36)
                }
                
                Button {
                    onXMarkPressed?()
                } label: {
                    Circle()
                        .fill(Color.theme.customDarkGray)
                        .overlay(
                            Image(systemName: "xmark")
                                .offset(y: 1)
                        )
                        .frame(width: 36, height: 36)
                }

            }
            .foregroundStyle(Color.theme.customWhite)
            .font(.subheadline)
            .fontWeight(.bold)
            .padding(8)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
        .aspectRatio(2, contentMode: .fit)
    }
}

#Preview {
    DetailsHeaderView()
}
