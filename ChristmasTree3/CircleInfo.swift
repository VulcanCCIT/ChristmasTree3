//
//  CircleInfo.swift
//  ChristmasTree3
//
//  Created by Chuck Condron on 12/24/23.
//

import Foundation

struct CircleInfo: Identifiable {
  let id = UUID()
  let scale: CGFloat
  let width: CGFloat
  let height: CGFloat
  let position: CGPoint
  let color: CircleColor
}
