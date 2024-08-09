//
//  HomeView.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 25/07/2024.
//

import SwiftUI

internal struct HomeView: View {
    
    @StateObject private var vm = HomeViewModel()
    
    internal var body: some View {
        ZStack(alignment: .top) {
            Color.theme.customBlack
                .ignoresSafeArea()
            
            vm.backgroundGradientLayer()
            
            vm.scrollViewLayer()
            
            vm.headerWithFilters()
        }
        .foregroundStyle(Color.theme.customWhite)
        .task {
            await vm.getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    HomeView()
}
