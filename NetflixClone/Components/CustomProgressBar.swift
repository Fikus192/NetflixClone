//
//  CustomProgressBar.swift
//  NetflixClone
//
//  Created by Mateusz Ratajczak on 09/08/2024.
//
//  From SwiftfulThinking:
//  https://github.com/SwiftfulThinking/SwiftfulUI/blob/main/Sources/SwiftfulUI/ProgressBars/CustomProgressBar.swift

import SwiftUI

public struct CustomProgressBar<T: BinaryFloatingPoint>: View {
        
    let selection: T
    let range: ClosedRange<T>
    let background: AnyShapeStyle
    let foreground: AnyShapeStyle
    let cornerRadius: CGFloat
    let height: CGFloat?
    
    /// Init with AnyShapeStyle (supports gradients)
    public init(
        selection: T,
        range: ClosedRange<T>,
        background: AnyShapeStyle = AnyShapeStyle(Color.gray.opacity(0.3)),
        foreground: AnyShapeStyle,
        cornerRadius: CGFloat = 100,
        height: CGFloat? = 8) {
            self.selection = selection
            self.range = range
            self.background = background
            self.foreground = foreground
            self.cornerRadius = cornerRadius
            self.height = height
        }
    
    /// Init with plain Colors
    public init(
        selection: T,
        range: ClosedRange<T>,
        backgroundColor: Color = Color.gray.opacity(0.3),
        foregroundColor: Color = .blue,
        cornerRadius: CGFloat = 100,
        height: CGFloat? = 8) {
            self.selection = selection
            self.range = range
            self.background = AnyShapeStyle(backgroundColor)
            self.foreground = AnyShapeStyle(foregroundColor)
            self.cornerRadius = cornerRadius
            self.height = height
        }
    
    public var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(background)

                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(foreground)
                    .frame(width: getCurrentProgress(geo: geo))
            }
        }
        .frame(height: height)
    }
    
    private func getCurrentProgress(geo: GeometryProxy) -> CGFloat {
        let minRange = max(range.lowerBound, 0)
        let maxRange = max(range.upperBound, 1)
        
        // Ensure progress is within range
        var safeSelection = min(selection, maxRange)
        safeSelection = max(safeSelection, minRange)

        let percent = (safeSelection - minRange) / (maxRange - minRange)
        return CGFloat(percent) * geo.size.width
    }
}
