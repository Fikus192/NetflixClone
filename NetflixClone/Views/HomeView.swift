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
        ZStack {
            Color.theme.customBlack
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                vm.header()
                    .padding(.horizontal, 16)
                
                FilterBarView(
                    filters: vm.filters,
                    selectedFilter: vm.selectedFilter,
                    onFilterPressed: { newFilter in
                        vm.selectedFilter = newFilter
                    },
                    onXMarkPressed: {
                        vm.selectedFilter = nil
                    }
                )
                .padding(.top, 16)
                
                Spacer()
            }
        }
        .foregroundStyle(Color.theme.customWhite)
    }
}

#Preview {
    HomeView()
}
