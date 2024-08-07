//
//  ScrollViewWithOnScrollChanged.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 07/08/2024.
//
//  From SwiftfulThinking:
//  https://github.com/SwiftfulThinking/SwiftfulUI/blob/main/Sources/SwiftfulUI/ScrollViews/ScrollViewWithOnScrollChanged.swift#L31

import SwiftUI

public struct ScrollViewWithOnScrollChanged<Content:View>: View {
    
    let axes: Axis.Set
    let showsIndicators: Bool
    let content: Content
    let onScrollChanged: (_ origin: CGPoint) -> ()
    @State private var coordinateSpaceID: String = UUID().uuidString
    
    public init(
        _ axes: Axis.Set = .vertical,
        showsIndicators: Bool = false,
        @ViewBuilder content: () -> Content,
        onScrollChanged: @escaping (_ origin: CGPoint) -> ()) {
            self.axes = axes
            self.showsIndicators = showsIndicators
            self.content = content()
            self.onScrollChanged = onScrollChanged
        }
    
    public var body: some View {
        ScrollView(axes, showsIndicators: showsIndicators) {
            LocationReader(coordinateSpace: .named(coordinateSpaceID), onChange: onScrollChanged)
            content
        }
        .coordinateSpace(name: coordinateSpaceID)
    }
}
