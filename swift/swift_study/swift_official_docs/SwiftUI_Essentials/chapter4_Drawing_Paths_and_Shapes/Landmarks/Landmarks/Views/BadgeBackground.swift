//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by 박요셉 on 2021/09/03.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in // Wrap the path in a GeometryReader so the badge can use the size of its containing view, which defines the size instead of hard-coding the value (100).
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height) // Using the smallest of the geometry’s two dimensions preserves the aspect ratio of the badge when its containing view isn’t square.
                    // 두 개의 가장 작은 dimensions를 사용하면 배지를 포함하는 View가 정사각형이 아닐 때 배지의 가로세로 비율이 유지된다.
                let height = width
                // 100px * 100px
                
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                
                // The move(to:) method moves the drawing cursor within the bounds of a shape as though an imaginary pen or pencil is hovering over the area, waiting to start drawing.
                
                HexagonParameters.segments.forEach{ segment in
                    path.addLine( // The addLine(to:) method takes a single point and draws it. Successive calls to addLine(to:) begin a line at the previous point and continue to the new point.
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
                    path.addQuadCurve( // Use the addQuadCurve(to:control:) method to draw the Bézier curves for the badge’s corners.
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            .fill(LinearGradient(gradient: Gradient(colors: [Self.gradientStart, Self.gradientEnd]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 0.6)))
            
        }
        .aspectRatio(1, contentMode: .fit)
        
    }
    // gradient 값 지정
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
