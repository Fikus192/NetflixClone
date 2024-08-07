//
//  LocationReader.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 07/08/2024.
//
//  From SwiftfulThinking:
//  https://github.com/SwiftfulThinking/SwiftfulUI/blob/main/Sources/SwiftfulUI/GeometryReaders/LocationReader.swift#L14

import SwiftUI

public struct LocationReader: View {
    
    let coordinateSpace: CoordinateSpace
    let onChange: (_ location: CGPoint) -> Void

    public init(coordinateSpace: CoordinateSpace, onChange: @escaping (_ location: CGPoint) -> Void) {
        self.coordinateSpace = coordinateSpace
        self.onChange = onChange
    }
    
    public var body: some View {
        FrameReader(coordinateSpace: coordinateSpace) { frame in
            onChange(CGPoint(x: frame.midX, y: frame.midY))
        }
        .frame(width: 0, height: 0, alignment: .center)
    }
}
