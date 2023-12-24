//
//  CirclesInTriangleView.swift
//  ChristmasTree3
//
//  Created by Chuck Condron on 12/24/23.
//

import SwiftUI

struct CirclesInTriangleView: View {
  
  let triangleSize: CGSize
  let colors: [CircleColor]
  let maxCircles: Int
  
  @State private var circles: [CircleInfo] = []
  
  var body: some View {
    ForEach(circles) { circleInfo in
      Circle()
        .foregroundColor(circleInfo.color.color)
        .scaleEffect(circleInfo.scale)
        .frame(
          width: circleInfo.width,
          height: circleInfo.height,
          alignment: .center
        )
        .position(circleInfo.position)
        .onAppear {
          withAnimation(
            Animation.spring(dampingFraction: 0.5)
              .speed(.random(in: 0.4...1.5))
              .delay(.random(in: 0...1))
              .repeatForever(autoreverses: false)
          ) {}
        }
    }
    .onAppear {
      Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
        let newCircle = CircleInfo(
          scale: .random(in: 0.1...0.75),
          width: .random(in: 1...20),
          height: .random(in: 10...25),
          position: generateRandomPoint(in: triangleSize),
          color: colors.randomElement() ?? .red
        )
        withAnimation {
          circles.append(newCircle)
        }
        
        // Randomly remove circles to create the appearing and disappearing effect
        if circles.count > maxCircles {
          circles.remove(at: Int.random(in: 0..<circles.count))
        }
      }
    }
  }
  
  func generateRandomPoint(in size: CGSize) -> CGPoint {
    while true {
      let x = CGFloat.random(in: 0...size.width)
      let y = CGFloat.random(in: 0...size.height)
      
      if isPointInsideTriangle(CGPoint(x: x, y: y)) {
        return CGPoint(x: x, y: y)
      }
    }
  }
  
  func isPointInsideTriangle(_ point: CGPoint) -> Bool {
    let p1 = CGPoint(x: triangleSize.width / 2, y: 0)
    let p2 = CGPoint(x: 0, y: triangleSize.height)
    let p3 = CGPoint(x: triangleSize.width, y: triangleSize.height)
    
    let area = 0.5 * abs(p2.x * p3.y - p3.x * p2.y - p1.x * p3.y + p3.x * p1.y + p1.x * p2.y - p2.x * p1.y)
    let area1 = 0.5 * abs(point.x * p2.y - p2.x * point.y - p1.x * p2.y + p2.x * p1.y + p1.x * point.y - point.x * p1.y)
    let area2 = 0.5 * abs(p1.x * point.y - point.x * p1.y - p3.x * point.y + point.x * p3.y + p3.x * p1.y - p1.x * p3.y)
    let area3 = 0.5 * abs(p2.x * p3.y - p3.x * p2.y - point.x * p3.y + p3.x * point.y + point.x * p2.y - p2.x * point.y)
    
    return area == area1 + area2 + area3
  }
}

//#Preview {
//    CirclesInTriangleView()
//}
