//
//  TriangleView.swift
//  ChristmasTree3
//
//  Created by Chuck Condron on 12/24/23.
//

import SwiftUI

struct TriangleView: View {
  var triangleFillColor: Color
  var colors: [CircleColor]
  var maxCircles: Int
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Path { path in
          path.move(to: CGPoint(x: geometry.size.width / 2, y: 0))
          path.addLine(to: CGPoint(x: 0, y: geometry.size.height))
          path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
          path.closeSubpath()
        }
        .fill(triangleFillColor)
        .overlay(CirclesInTriangleView(triangleSize: geometry.size, colors: colors, maxCircles: maxCircles))
      }
    }
  }
}

#Preview {
  TriangleView(triangleFillColor: .blue, colors: [.red, .green, .blue, .white], maxCircles: 100)
}
