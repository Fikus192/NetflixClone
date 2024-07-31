//
//  FilterBarView.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 30/07/2024.
//

import SwiftUI

internal struct FilterBarView: View {
    
    var filters: [FilterModel] = FilterModel.mockArray
    var selectedFilter: FilterModel? = nil
    var onFilterPressed: ((FilterModel) -> Void)? = nil
    var onXMarkPressed: (() -> Void)? = nil
    
    internal var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if selectedFilter != nil {
                    Button {
                        onXMarkPressed?()
                    } label: {
                        Image(systemName: "xmark")
                            .padding(8)
                            .background(
                                Circle()
                                    .stroke(lineWidth: 1)
                            )
                            .foregroundStyle(Color.theme.customLightGray)
                            .background(
                                Color.theme.customBlack
                                    .opacity(0.001)
                            )
                    }
                    .transition(AnyTransition.move(edge: .leading))
                    .padding(.leading, 16)
                }
                
                ForEach(filters, id: \.self) { filter in
                    if selectedFilter == nil || selectedFilter == filter {
                        Button {
                            onFilterPressed?(filter)
                        } label: {
                            SingleFilterView(
                                title: filter.title,
                                isDropdown: filter.isDropdown,
                                isSelected: selectedFilter == filter
                            )
                            .background(
                                Color.theme.customBlack
                                    .opacity(0.001)
                            )
                        }
                        .padding(.leading, ((selectedFilter == nil) && filter == filters.first) ? 16: 0)
                    }
                }
            }
            .padding(.vertical, 4)
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }
}

fileprivate struct FilterBarViewPreview: View {
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    
    var body: some View {
        FilterBarView(
            filters: filters,
            selectedFilter: selectedFilter,
            onFilterPressed: { newFilter in
                selectedFilter = newFilter
            },
            onXMarkPressed: {
                selectedFilter = nil
            }
        )
    }
}

#Preview {
    ZStack {
        Color.theme.customBlack
            .ignoresSafeArea()
        FilterBarViewPreview()
    }
}
