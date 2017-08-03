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

class ViewController: UIViewController {
  
  @IBOutlet weak var backgroundView: UIView!
  
  private var animatedBeziers: [AnimatableElement] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    let color = UIColor(red:0.20, green:0.80, blue:0.38, alpha:1.0)
    let alphaLevels = [CGFloat(0.0), CGFloat(0.1), CGFloat(0.25), CGFloat(0.4), CGFloat(0.55)]
    
    // Spiral points
    let numberOfPoints = 500
    
    let spiralPoints1 = drawSpiral(arc: 20.0, separation: 0.8, numPoints: numberOfPoints, center: CGPoint(x: 165, y: 600))
    let spiralPoints2 = drawSpiral(arc: 3.0, separation: 0.5, numPoints: numberOfPoints, center: CGPoint(x: 316, y: 1051), rotationDegrees: 90.0, invert: true)
    let spiralPoints3 = drawSpiral(arc: 8.0, separation: 0.6, numPoints: numberOfPoints, center: CGPoint(x: 510, y: 943), rotationDegrees: 45.0)
    let spiralPoints4 = drawSpiral(arc: 17.0, separation: 0.5, numPoints: numberOfPoints, center: CGPoint(x: 1252, y: 745), rotationDegrees: 180.0, invert: true)
    let spiralPoints5 = drawSpiral(arc: 16.0, separation: 0.5, numPoints: numberOfPoints, center: CGPoint(x: 822, y: 572), rotationDegrees: 45.0)
    let spiralPoints6 = drawSpiral(arc: 7.0, separation: 0.3, numPoints: numberOfPoints, center: CGPoint(x: 1014, y: 383), rotationDegrees: 30.0, invert: true)
    let spiralPoints7 = drawSpiral(arc: 6.0, separation: 0.4, numPoints: numberOfPoints, center: CGPoint(x: 1585, y: 214), rotationDegrees: 270.0)
    let spiralPoints8 = drawSpiral(arc: 8.0, separation: 0.5, numPoints: numberOfPoints, center: CGPoint(x: 1488, y: 381), rotationDegrees: 200.0, invert: true)
    
    
    // Triangle 1
    drawTriangle(point1: CGPoint.zero, point2: CGPoint(x: 387, y: -96), point3: CGPoint(x: 0, y: 270), fillColor: color.withAlphaComponent(alphaLevels[0]))
    
    // Triangle 2
    drawTriangle(points1: spiralPoints1, point2: CGPoint(x: 0, y: 270), point3: CGPoint(x: -462, y: 850), fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    // Triangle 3
    drawTriangle(points1: spiralPoints1, point2: CGPoint(x: 0, y: 270), point3: CGPoint(x: 387, y: -96),  fillColor: color.withAlphaComponent(alphaLevels[4]))
    
    // Triangle 4
    drawTriangle(points1: spiralPoints1, points2: spiralPoints2, point3: CGPoint(x: -462, y: 850), fillColor: color.withAlphaComponent(alphaLevels[2]))

    // Triangle 5
    drawTriangle(points1: spiralPoints1, points2: spiralPoints5, point3: CGPoint(x: 387, y: -96), fillColor: color.withAlphaComponent(alphaLevels[3]))

    // Triangle 6
    drawTriangle(points1: spiralPoints1, points2: spiralPoints5, points3: spiralPoints3, fillColor: color.withAlphaComponent(alphaLevels[4]))

    // Triangle 7
    drawTriangle(points1: spiralPoints1, points2: spiralPoints3, points3: spiralPoints2, fillColor: color.withAlphaComponent(alphaLevels[0]))

    // Triangle 8
    drawTriangle(points1: spiralPoints2, point2: CGPoint(x: -462, y: 850), point3: CGPoint(x: -205, y: 1200), fillColor: color.withAlphaComponent(alphaLevels[0]))

    // Triangle 9
    drawTriangle(points1: spiralPoints2, point2: CGPoint(x: -205, y: 1200), point3: CGPoint(x: 140, y: 1290), fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    // Triangle 10
    drawTriangle(points1: spiralPoints2, point2: CGPoint(x: 140, y: 1290), point3: CGPoint(x: 473, y: 1080), fillColor: color.withAlphaComponent(alphaLevels[4]))

    // Triangle 11
    drawTriangle(points1: spiralPoints2, points2: spiralPoints3, point3: CGPoint(x: 473, y: 1080), fillColor: color.withAlphaComponent(alphaLevels[3]))

    // Triangle 12
    drawTriangle(points1: spiralPoints3, point2: CGPoint(x: 473, y: 1080), point3: CGPoint(x: 785, y: 1285), fillColor: color.withAlphaComponent(alphaLevels[4]))

    // Triangle 13
    drawTriangle(points1: spiralPoints3, points2: spiralPoints4, point3: CGPoint(x: 785, y: 1285), fillColor: color.withAlphaComponent(alphaLevels[1]))

    // Triangle 14
    drawTriangle(points1: spiralPoints3, points2: spiralPoints4, points3: spiralPoints5, fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    // Triangle 15
    drawTriangle(points1: spiralPoints5, point2: CGPoint(x: 387, y: -96), point3: CGPoint(x: 910, y: -170), fillColor: color.withAlphaComponent(alphaLevels[2]))

    // Triangle 16
    drawTriangle(points1: spiralPoints5, points2: spiralPoints6, point3: CGPoint(x: 910, y: -170), fillColor: color.withAlphaComponent(alphaLevels[4]))

    // Triangle 17
    drawTriangle(points1: spiralPoints6, point2: CGPoint(x: 910, y: -170), point3: CGPoint(x: 1233, y: -114), fillColor: color.withAlphaComponent(alphaLevels[1]))

    // Triangle 18
    drawTriangle(points1: spiralPoints4, points2: spiralPoints5, points3: spiralPoints6, fillColor: color.withAlphaComponent(alphaLevels[1]))
  
    // Triangle 19
    drawTriangle(points1: spiralPoints4, point2: CGPoint(x: 785, y: 1285), point3: CGPoint(x: 1330, y: 1166), fillColor: color.withAlphaComponent(alphaLevels[0]))

    // Triangle 20
    drawTriangle(points1: spiralPoints4, points2: spiralPoints8, point3: CGPoint(x: 1330, y: 1166), fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    // Triangle 21
    drawTriangle(points1: spiralPoints4, points2: spiralPoints6, points3: spiralPoints8, fillColor: color.withAlphaComponent(alphaLevels[0]))

    // Triangle 22
    drawTriangle(points1: spiralPoints6, points2: spiralPoints7, points3: spiralPoints8, fillColor: color.withAlphaComponent(alphaLevels[2]))

    // Triangle 23
    drawTriangle(points1: spiralPoints6, points2: spiralPoints7, point3: CGPoint(x: 1233, y: -114), fillColor: color.withAlphaComponent(alphaLevels[3]))

    // Triangle 24
    drawTriangle(points1: spiralPoints7, point2: CGPoint(x: 1233, y: -114), point3: CGPoint(x: 1713, y: -298), fillColor: color.withAlphaComponent(alphaLevels[1]))

    // Triangle 25
    drawTriangle(points1: spiralPoints7, point2: CGPoint(x: 1713, y: -298), point3: CGPoint(x: 2044, y: 99), fillColor: color.withAlphaComponent(alphaLevels[0]))

    // Triangle 26
    drawTriangle(points1: spiralPoints7, point2: CGPoint(x: 2044, y: 99), point3: CGPoint(x: 1920, y: 560), fillColor: color.withAlphaComponent(alphaLevels[3]))

    // Triangle 27
    drawTriangle(points1: spiralPoints7, points2: spiralPoints8, point3: CGPoint(x: 1920, y: 560), fillColor: color.withAlphaComponent(alphaLevels[1]))

    // Triangle 28
    drawTriangle(points1: spiralPoints8, point2: CGPoint(x: 1920, y: 560), point3: CGPoint(x: 2006, y: 1010), fillColor: color.withAlphaComponent(alphaLevels[3]))

    // Triangle 29
    drawTriangle(points1: spiralPoints8, point2: CGPoint(x: 2006, y: 1010), point3: CGPoint(x: 1330, y: 1166), fillColor: color.withAlphaComponent(alphaLevels[1]))

    // Triangle 30
    drawTriangle(point1: CGPoint(x: 2006, y: 1010), point2: CGPoint(x: 1330, y: 1166), point3: CGPoint(x: 1950, y: 1135), fillColor: color.withAlphaComponent(alphaLevels[4]))
    
    
    for elem in animatedBeziers {
      
      let animTime = 2.0
      
      let group = CAAnimationGroup()
      var animations: [CAAnimation] = []
      
      group.fillMode = kCAFillModeForwards
      group.isRemovedOnCompletion = false
      
      for i in 0...elem.beziers.count-2 {
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = elem.beziers[i].cgPath
        animation.toValue = elem.beziers[i+1].cgPath
        animation.duration = animTime
        animation.beginTime = CFTimeInterval(animTime * Double(i))
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        animations.append(animation)
      }
      
      group.autoreverses = true
      group.animations = animations
      group.repeatCount = .infinity
      group.duration = CFTimeInterval(Double(animations.count) * animTime)

      elem.layer.add(group, forKey: "anim")
    }
  }
  
  
  func drawTriangle(point1: CGPoint, point2: CGPoint, point3: CGPoint, fillColor: UIColor){
    drawTriangle(points1: [point1], points2: [point2], points3: [point3], fillColor: fillColor)
  }
  
  func drawTriangle(points1: [CGPoint], point2: CGPoint, point3: CGPoint, fillColor: UIColor){
    drawTriangle(points1: points1, points2: [point2], points3: [point3], fillColor: fillColor)
  }
  
  func drawTriangle(points1: [CGPoint], points2: [CGPoint], point3: CGPoint, fillColor: UIColor){
    drawTriangle(points1: points1, points2: points2, points3: [point3], fillColor: fillColor)
  }
  
  func drawTriangle(points1: [CGPoint], points2: [CGPoint], points3: [CGPoint], fillColor: UIColor){
    var beziers: [UIBezierPath] = []
    
    for (i, point1) in points1.enumerated() {
      beziers.append(createBezierPath(point1: point1, point2: (points2.count > 1 ? points2[i] : points2.first!), point3: (points3.count > 1 ? points3[i] : points3.first!)))
    }
    
    guard let path = beziers.first else {
      return
    }
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    shapeLayer.lineWidth = 0
    shapeLayer.fillColor = fillColor.cgColor
    backgroundView.layer.addSublayer(shapeLayer)
    
    if points1.count > 1 {
      animatedBeziers.append(AnimatableElement(beziers: beziers, layer: shapeLayer))
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
  
  func drawSpiral(arc: Double, separation: Double, numPoints: Int, center: CGPoint, rotationDegrees: CGFloat = 0, invert: Bool = false) -> [CGPoint] {
    
    /**
     generate points on an Archimedes' spiral
     with `arc` giving the length of arc between two points
     and `separation` giving the distance between consecutive
     turnings
     - approximate arc length with circle arc at given distance
     - use a spiral equation r = b * phi
     **/
    
    var numPoints = numPoints
    
    func rotatePoint(target: CGPoint, aroundOrigin origin: CGPoint, byDegrees: CGFloat) -> CGPoint {
      let dx = target.x - origin.x
      let dy = target.y - origin.y
      let radius = sqrt(dx * dx + dy * dy)
      let azimuth = atan2(dy, dx) // in radians
      let newAzimuth = azimuth + byDegrees * CGFloat(Double.pi/180.0) // convert it to radians
      let x = origin.x + radius * cos(newAzimuth)
      let y = origin.y + radius * sin(newAzimuth)
      return CGPoint(x: x, y: y)
    }
    
    // polar to cartesian
    func p2c(r:Double, phi: Double) -> CGPoint {
      
      var x = r * cos(phi)
      var y = r * sin(phi)
      
      if invert {
        let tmpX = x
        x = -y
        y = -tmpX
      }
      
      return rotatePoint(target: CGPoint(x: CGFloat(x) + center.x, y: CGFloat(y) + center.y), aroundOrigin: center, byDegrees: rotationDegrees)
    }
    
    // yield a point at origin
    var result = [CGPoint(x:0 + center.x, y: 0 + center.y)]
    
    // initialize the next point in the required distance
    var r = arc
    let b = separation / (2 * .pi)
    
    // find the first phi to satisfy distance of `arc` to the second point
    var phi = r / b
    
    while numPoints > 0 {
      result.append(p2c(r: r, phi: phi))
      
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
