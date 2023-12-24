//
//  ContentView.swift
//  ChristmasTree3
//
//  Created by Chuck Condron on 12/24/23.
//

import SwiftUI

enum CircleColor: CaseIterable {
  case red, green, blue, white
  
  var color: Color {
    switch self {
      case .red: return .red
      case .green: return .green
      case .blue: return .blue
      case .white: return .white
    }
  }
}

struct ContentView: View {
  @State private var isVisible = false
  
  var body: some View {
    VStack {
      ZStack {
        BubbleViewStars()
        
        Image(systemName: "star.fill")
          .foregroundColor(.white)
          .font(.system(size: 25))
          .opacity(isVisible ? 1.0 : 0.0)
          .onAppear {
            withAnimation(Animation.easeInOut(duration: 0.8).repeatForever()) {
              self.isVisible.toggle()
            }
          }
          .offset(CGSize(width: 0.0, height: -275.0))
        
        TriangleView(triangleFillColor: .darkGreen, colors: [.red, .green, .blue, .white], maxCircles: 30)
          .frame(width: 50, height: 110)
          .offset(CGSize(width: 0.0, height: -220.0))
        
        TriangleView(triangleFillColor: .darkGreen, colors: [.red, .green, .blue, .white], maxCircles: 30)
          .frame(width: 125, height: 50)
          .offset(CGSize(width: 0.0, height: -150.0))
        
        TriangleView(triangleFillColor: .darkGreen, colors: [.red, .green, .blue, .white], maxCircles: 100)
          .frame(width: 175, height: 50)
          .offset(CGSize(width: 0.0, height: -100.0))
        
        TriangleView(triangleFillColor: .darkGreen, colors: [.red, .green, .blue, .white], maxCircles: 100)
          .frame(width: 225, height: 100)
          .offset(CGSize(width: 0.0, height: -50.0))
        
        TriangleView(triangleFillColor: .darkGreen, colors: [.red, .green, .blue, .white], maxCircles: 100)
          .frame(width: 275, height: 100)
          .offset(CGSize(width: 0.0, height: 0.0))
        
        TriangleView(triangleFillColor: .darkGreen, colors: [.red, .green, .blue, .white], maxCircles: 100)
          .frame(width: 325, height: 100)
          .offset(CGSize(width: 0.0, height: 50.0))
        
        TriangleView(triangleFillColor: .darkGreen, colors: [.red, .green, .blue, .white], maxCircles: 100)
          .frame(width: 375, height: 100)
          .offset(CGSize(width: 0.0, height: 100.0))
        
        Rectangle()
          .fill(.darkBrown)
          .frame(width: 40, height: 100)
          .offset(CGSize(width: 0.0, height: 200.0))
        
        Text("Merry Christmas")
          .fontWeight(.bold)
          .font(.largeTitle)
          .offset(CGSize(width: 0.0, height: 300.0))
          .phaseAnimator([0,1,2,2,1,1]) { content, phase in content
              .foregroundColor(phase == 1 ? .green: .red)
          } animation: { phase in
              .easeIn(duration: 2).repeatForever()
          }
      }
    }
    .background(.black)
  }
}

#Preview {
  ContentView()
}
