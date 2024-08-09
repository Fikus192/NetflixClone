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
        ZStack {
            ImageLoaderView(urlString: imageName)
        }
        .aspectRatio(2, contentMode: .fit)
    }
}

#Preview {
    DetailsHeaderView()
}
