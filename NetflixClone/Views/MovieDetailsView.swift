//
//  MovieDetailsView.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 09/08/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var product: Product? = nil
    
    var body: some View {
        ZStack {
            Color.theme.customBlack
                .ignoresSafeArea()
            Color.theme.customDarkGray
                .opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
            }
        }
    }
}

#Preview {
    MovieDetailsView()
}
