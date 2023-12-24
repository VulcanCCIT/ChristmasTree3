//
//  BubbleViewStars.swift
//  ChristmasTree
//
//  Created by Chuck Condron on 12/21/23.
//

import SwiftUI

struct BubbleViewStars: View {
  
  @State private var scale : CGFloat = 1.0
  
  var body: some View {
    ZStack {
      ForEach (1...100, id:\.self) { _ in
        
        //white
        
        Circle()
          .foregroundColor(.white)
        
          .blendMode(.colorDodge) // The bottom circle is lightened by an amount determined by the top layer
          .animation (Animation.spring (dampingFraction: 0.5).repeatForever()
            .speed (.random(in: 0.4...1.5))
            .delay(.random (in: 0...1)), value: scale)
        
          .scaleEffect(self.scale * .random(in: 0.1...1.5))
          .frame(width: .random(in: 1...20),
                 height: CGFloat.random (in: 10...25),
                 alignment: .center)
          .position(CGPoint(x: .random(in: 0...500),
                            y: .random (in: -350...350)))
      }
    }
    .onAppear { self.scale = 0.5 } // default circle scale
    .drawingGroup(opaque: false, colorMode: .linear)
  }//view
}

#Preview {
  BubbleViewStars()
}
