//
//  RateButton.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 14/08/2024.
//

import SwiftUI

internal enum RateOption: String, CaseIterable {
    case dislike
    case like
    case love
    
    var title: String {
        switch self {
        case .dislike:
            return "Not For Me"
        case .like:
            return "I like this"
        case .love:
            return "Love this!"
        }
    }
    
    var iconName: String {
        switch self {
        case .dislike:
            return "hand.thumbsdown"
        case .like:
            return "hand.thumbsup"
        case .love:
            return "bolt.heart"
        }
    }
}

internal struct RateButton: View {
    
    @State private var showPopover: Bool = false
    var onRatingSelected: ((RateOption) -> Void)? = nil
    
    internal var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "hand.thumbsup")
                .font(.title)
            
            Text("Rate")
                .font(.caption)
                .foregroundStyle(Color.theme.customLightGray)
        }
        .foregroundStyle(Color.theme.customWhite)
        .padding(8)
        .background(Color.theme.customBlack.opacity(0.001))
        .onTapGesture {
            showPopover.toggle()
        }
        .popover(isPresented: $showPopover) {
            ZStack {
                Color.theme.customDarkGray.ignoresSafeArea()
                
                HStack(spacing: 12) {
                    ForEach(RateOption.allCases, id: \.self) { option in
                        rateButton(option: option)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
            .presentationCompactAdaptation(.popover)
        }
    }
    
    private func rateButton(option: RateOption) -> some View {
        VStack(spacing: 8) {
            Image(systemName: option.iconName)
                .font(.title2)
            
            Text(option.title)
                .font(.caption)
        }
        .foregroundStyle(Color.theme.customWhite)
        .padding(4)
        .background(Color.theme.customBlack.opacity(0.001))
        .onTapGesture {
            showPopover = false
            onRatingSelected?(option)
        }
    }
}

#Preview {
    ZStack {
        Color.theme.customBlack
            .ignoresSafeArea()
        
        RateButton()
    }
}
