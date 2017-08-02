//
//  ViewController.swift
//  QminderBackground
//
//  Created by Kristaps Grinbergs on 31/07/2017.
//  Copyright © 2017 qminder. All rights reserved.
//

import UIKit
import QuartzCore

typealias AnimatableElement = (beziers: [UIBezierPath], layer: CAShapeLayer)

typealias TrianglePoints = (point1: CGPoint, point2: CGPoint, point3: CGPoint)

class ViewController: UIViewController {
  
  @IBOutlet weak var backgroundView: UIView!
  
  private var animatedBeziers: [AnimatableElement] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func drawTriangle(points: [TrianglePoints], fillColor: UIColor) {
    var beziers: [UIBezierPath] = []
    
    for p in points {
      beziers.append(createBezierPath(point1: p.point1, point2: p.point2, point3: p.point3))
    }
    
    guard let path = beziers.first else {
      return
    }
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    shapeLayer.lineWidth = 0
    shapeLayer.fillColor = fillColor.cgColor
    backgroundView.layer.addSublayer(shapeLayer)
    
    if points.count > 1 {
      animatedBeziers.append(AnimatableElement(beziers: beziers, layer: shapeLayer))
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    let color = UIColor(red:0.20, green:0.80, blue:0.38, alpha:1.0)
    let alphaLevels = [CGFloat(0.0), CGFloat(0.1), CGFloat(0.25), CGFloat(0.4), CGFloat(0.55)]
    
    let numberOfPoints = 500
    
//    let spiralPoints = drawSpiral(arc: 15.0, separation: 1.0, numPoints: 500, offset: CGPoint(x: 400, y: 600))
//    let spiral2Points = drawSpiral(arc: 30.0, separation: 3.0, numPoints: 500, offset: CGPoint(x: 600, y: 300))
    
//    var beziers: [UIBezierPath] = []
    
//    var tmpLayer: CAShapeLayer
    
    var tmpPoints: [TrianglePoints] = []
    
    // Triangle 1
    drawTriangle(points: [TrianglePoints(point1: CGPoint.zero, point2: CGPoint(x: 387, y: -96), point3: CGPoint(x: 0, y: 270))], fillColor: color.withAlphaComponent(alphaLevels[1]))
    
    
    // Triangle 2
    let spiralPoints1 = drawSpiral(arc: 20.0, separation: 1.0, numPoints: numberOfPoints, offset: CGPoint(x: 165, y: 600))
    
    for point in spiralPoints1 {
      tmpPoints.append(TrianglePoints(point1: CGPoint(x: 0, y: 270), point2: point, point3: CGPoint(x: -462, y: 850)))
    }
    
    drawTriangle(points: tmpPoints, fillColor: color.withAlphaComponent(alphaLevels[2]))
    
    
    // Triangle 3
    tmpPoints.removeAll()
    
    for point in spiralPoints1 {
      tmpPoints.append(TrianglePoints(point1: CGPoint(x: 0, y: 270), point2: point, point3: CGPoint(x: 387, y: -96)))
    }
    
    drawTriangle(points: tmpPoints, fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    
    // Triangle 4
    tmpPoints.removeAll()

    let spiralPoints2 = drawSpiral(arc: 5.0, separation: 0.3, numPoints: numberOfPoints, offset: CGPoint(x: 316, y: 1051))
    
    for (i, point) in spiralPoints1.enumerated() {
      tmpPoints.append(TrianglePoints(point1: point, point2: spiralPoints2[i], point3: CGPoint(x: -462, y: 850)))
    }

    drawTriangle(points: tmpPoints, fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    
    // Triangle 5
    tmpPoints.removeAll()
    
    for point in spiralPoints1 {
      tmpPoints.append(TrianglePoints(point1: point, point2: CGPoint(x: 387, y: -96), point3: CGPoint(x: 822, y: 572)))
    }
    
    drawTriangle(points: tmpPoints, fillColor: color.withAlphaComponent(alphaLevels[1]))
    
    
    // Triangle 6
    tmpPoints.removeAll()
    
    let spiralPoints3 = drawSpiral(arc: 15, separation: 0.5, numPoints: numberOfPoints, offset: CGPoint(x: 510, y: 943))
    
    for (i, point) in spiralPoints1.enumerated() {
      tmpPoints.append(TrianglePoints(point1: point, point2: CGPoint(x: 822, y: 572), point3: spiralPoints3[i]))
    }
    
    drawTriangle(points: tmpPoints, fillColor: color.withAlphaComponent(alphaLevels[2]))
    
    
    // Triangle 7
    tmpPoints.removeAll()
    
    for (i, point) in spiralPoints1.enumerated() {
      tmpPoints.append(TrianglePoints(point1: point, point2: spiralPoints3[i], point3: spiralPoints2[i]))
    }
    
    drawTriangle(points: tmpPoints, fillColor: color.withAlphaComponent(alphaLevels[4]))
    
    
    // Triangle 8
    tmpPoints.removeAll()
    
    for point in spiralPoints2 {
      tmpPoints.append(TrianglePoints(point1: point, point2: CGPoint(x: -462, y: 850), point3: CGPoint(x: -205, y: 1200)))
    }
    
    drawTriangle(points: tmpPoints, fillColor: color.withAlphaComponent(alphaLevels[1]))
    
    
    // Triangle 9
    tmpPoints.removeAll()
    
    for point in spiralPoints2 {
      tmpPoints.append(TrianglePoints(point1: point, point2: CGPoint(x: -205, y: 1200), point3: CGPoint(x: 140, y: 1290)))
    }
    
    drawTriangle(points: tmpPoints, fillColor: color.withAlphaComponent(alphaLevels[2]))
    
    
    // Triangle 10
    tmpPoints.removeAll()
    
    for point in spiralPoints2 {
      tmpPoints.append(TrianglePoints(point1: point, point2: CGPoint(x: 140, y: 1290), point3: CGPoint(x: 473, y: 1080)))
    }
    
    drawTriangle(points: tmpPoints, fillColor: color.withAlphaComponent(alphaLevels[4]))
    
    
    // Triangle 11
    tmpPoints.removeAll()
    
    for (i, point) in spiralPoints2.enumerated() {
      tmpPoints.append(TrianglePoints(point1: point, point2: spiralPoints3[i], point3: CGPoint(x: 473, y: 1080)))
    }
    
    drawTriangle(points: tmpPoints, fillColor: color.withAlphaComponent(alphaLevels[1]))
    
    
    // Triangle 12
    tmpPoints.removeAll()
    
    for point in spiralPoints3 {
      tmpPoints.append(TrianglePoints(point1: point, point2: CGPoint(x: 473, y: 1080), point3: CGPoint(x: 785, y: 1285)))
    }
    
    drawTriangle(points: tmpPoints, fillColor: color.withAlphaComponent(alphaLevels[4]))
    
    // Triangle 13
    tmpPoints.removeAll()
    
    let spiralPoints4 = drawSpiral(arc: 17, separation: 1.5, numPoints: numberOfPoints, offset: CGPoint(x: 1252, y: 745))
    
    for (i, point) in spiralPoints3.enumerated() {
      tmpPoints.append(TrianglePoints(point1: point, point2: spiralPoints4[i], point3: CGPoint(x: 785, y: 1285)))
    }
    
    drawTriangle(points: tmpPoints, fillColor: color.withAlphaComponent(alphaLevels[1]))
    
    
//    beziers.removeAll()
//    
//    
//    
//    
//    
//    for point in spiralPoints {
//      beziers.append(createBezierPath(point1: CGPoint(x: 100, y: 300), point2: point, point3: CGPoint(x: -100, y: 800)))
//    }
//    tmpLayer = createTriangleLayer(path: beziers.first!, fillColor: UIColor.brown)
//    backgroundView.layer.addSublayer(tmpLayer)
//    layers.append(tmpLayer)
//    animatedBeziers.append(AnimatableElement(beziers: beziers, layer: tmpLayer))
//    
//    beziers.removeAll()
//    for point in spiralPoints {
//      beziers.append(createBezierPath(point1: CGPoint(x: 0, y: 800), point2: point, point3: CGPoint(x: 0, y: 1080)))
//    }
//    tmpLayer = createTriangleLayer(path: beziers.first!, fillColor: UIColor.green)
//    backgroundView.layer.addSublayer(tmpLayer)
//    layers.append(tmpLayer)
//    animatedBeziers.append(AnimatableElement(beziers: beziers, layer: tmpLayer))
//    
//    beziers.removeAll()
//    for point in spiralPoints {
//      beziers.append(createBezierPath(point1: CGPoint(x: 0, y: 1080), point2: point, point3: CGPoint(x: 600, y: 1080)))
//    }
//    tmpLayer = createTriangleLayer(path: beziers.first!, fillColor: UIColor.gray)
//    backgroundView.layer.addSublayer(tmpLayer)
//    layers.append(tmpLayer)
//    animatedBeziers.append(AnimatableElement(beziers: beziers, layer: tmpLayer))
//    
//    beziers.removeAll()
//    for (i, point) in spiralPoints.enumerated() {
//      beziers.append(createBezierPath(point1: point, point2: spiral2Points[i], point3: CGPoint(x: 800, y: 800)))
//    }
//    tmpLayer = createTriangleLayer(path: beziers.first!, fillColor: UIColor.black)
//    backgroundView.layer.addSublayer(tmpLayer)
//    layers.append(tmpLayer)
//    animatedBeziers.append(AnimatableElement(beziers: beziers, layer: tmpLayer))
    
    for elem in animatedBeziers {
      
      let group = CAAnimationGroup()
      var animations: [CAAnimation] = []
      
      group.fillMode = kCAFillModeForwards
      group.isRemovedOnCompletion = false
      
      for i in 0...elem.beziers.count-2 {
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = elem.beziers[i].cgPath
        animation.toValue = elem.beziers[i+1].cgPath
        animation.duration = 1.0
        animation.beginTime = CFTimeInterval(1 * i)
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        animations.append(animation)
      }
      
      group.autoreverses = true
      group.animations = animations
      group.repeatCount = .infinity
      group.duration = CFTimeInterval(animations.count)

      elem.layer.add(group, forKey: "anim")
    }
  }
  
  func createBezierPath(point1: CGPoint, point2: CGPoint, point3: CGPoint) -> UIBezierPath {
    let bezierPath = UIBezierPath()
    bezierPath.move(to: point1)
    bezierPath.addLine(to: point2)
    bezierPath.addLine(to: point3)
    bezierPath.addLine(to: point1)
    bezierPath.close()
    
    return bezierPath
  }
  
  func createTriangleLayer(path: UIBezierPath, fillColor: UIColor) -> CAShapeLayer {
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    shapeLayer.lineWidth = 0
    shapeLayer.fillColor = fillColor.cgColor
    
    return shapeLayer
  }
  
  func drawSpiral(arc: Double, separation: Double, numPoints: Int, offset: CGPoint) -> [CGPoint] {
    
    /**
     generate points on an Archimedes' spiral
     with `arc` giving the length of arc between two points
     and `separation` giving the distance between consecutive
     turnings
     - approximate arc length with circle arc at given distance
     - use a spiral equation r = b * phi
     **/
    
    var numPoints = numPoints
    
    // polar to cartesian
    func p2c(r:Double, phi: Double, offset: CGPoint) -> CGPoint {
      return CGPoint(x: CGFloat(r * cos(phi)) + offset.x, y: CGFloat(r * sin(phi)) + offset.y)
    }
    
    // yield a point at origin
    var result = [CGPoint(x:0 + offset.x, y: 0 + offset.y)]
    
    // initialize the next point in the required distance
    var r = arc
    let b = separation / (2 * .pi)
    
    // find the first phi to satisfy distance of `arc` to the second point
    var phi = r / b
    
    while numPoints > 0 {
      result.append(p2c(r: r, phi: phi, offset: offset))
      
      //      advance the variables
      //      calculate phi that will give desired arc length at current radius
      //      (approximating with circle)
      
      phi += arc / r
      r = b * phi
      numPoints -= 1
    }
    
    return result
  }
  
}


/**
 
 
 
 */
