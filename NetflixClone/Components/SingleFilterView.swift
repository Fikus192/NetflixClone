//
//  SingleFilterView.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 30/07/2024.
//

import SwiftUI

internal struct SingleFilterView: View {
    
    var title: String = "Categories"
    var isDropdown: Bool = false
    var isSelected: Bool = false
    
    internal var body: some View {
        HStack(spacing: 4) {
            Text(title)
            
            if isDropdown {
                Image(systemName: "chevron.down")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            ZStack {
                Capsule(style: .circular)
                    .fill(Color.theme.customDarkGray)
                    .opacity(isSelected ? 1 : 0)
                
                Capsule(style: .circular)
                    .stroke(lineWidth: 1)
            }
        )
        .foregroundStyle(Color.theme.customLightGray)
    }
}

#Preview {
    ZStack {
        Color.theme.customBlack
            .ignoresSafeArea()
        
        VStack {
            SingleFilterView()
            SingleFilterView(isSelected: true)
            SingleFilterView(isDropdown: false)
        }
    }
}
