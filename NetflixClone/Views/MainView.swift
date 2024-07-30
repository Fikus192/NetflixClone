//
//  HomeView.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 25/07/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.theme.customBlack
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                vm.header()
                    .padding(.horizontal, 16)
                
                Spacer()
            }
        }
        .foregroundStyle(Color.theme.customWhite)
    }
}

#Preview {
    HomeView()
}
