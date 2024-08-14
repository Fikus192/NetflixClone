//
//  MyListButton.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 14/08/2024.
//

import SwiftUI

internal struct MyListButton: View {
    
    var isMyList: Bool = false
    var onButtonPressed: (() -> Void)? = nil
    
    internal var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Image(systemName: "checkmark")
                    .opacity(isMyList ? 1 : 0)
                    .rotationEffect(Angle(degrees: isMyList ? 0 : 180))
                
                Image(systemName: "plus")
                    .opacity(isMyList ? 0 : 1)
                    .rotationEffect(Angle(degrees: isMyList ? -180 : 0))

            }
            .font(.title)
            
            Text("My List")
                .font(.caption)
                .foregroundStyle(Color.theme.customLightGray)
        }
        .foregroundStyle(Color.theme.customWhite)
        .padding(8)
        .background(Color.theme.customBlack.opacity(0.001))
        .animation(.bouncy, value: isMyList)
        .onTapGesture {
            onButtonPressed?()
        }
    }
}

fileprivate struct MyListButtonPreview: View {
    
    @State private var isMyList: Bool = false
    
    var body: some View {
        MyListButton(isMyList: isMyList) {
            isMyList.toggle()
        }
    }
}

#Preview {
    ZStack {
        Color.theme.customBlack
            .ignoresSafeArea()
        
        MyListButtonPreview()
    }
}
