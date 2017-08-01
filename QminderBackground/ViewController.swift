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
  
  private var layers: [CAShapeLayer] = []
  private var animatedBeziers: [AnimatableElement] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    let spiralPoints = drawSpiral(arc: 10.0, separation: 3.0, numPoints: 100, offset: CGPoint(x: 400, y: 600))
    
    var beziers: [UIBezierPath] = []
    beziers.removeAll()
    
    var tmpLayer: CAShapeLayer
    
    for point in spiralPoints {
      beziers.append(createBezierPath(point1: CGPoint(x: 0, y: 300), point2: point, point3: CGPoint(x: 0, y: 800)))
    }
    tmpLayer = createTriangleLayer(path: beziers.first!, fillColor: UIColor.brown)
    backgroundView.layer.addSublayer(tmpLayer)
    layers.append(tmpLayer)
    animatedBeziers.append(AnimatableElement(beziers: beziers, layer: tmpLayer))
    
    beziers.removeAll()
    for point in spiralPoints {
      beziers.append(createBezierPath(point1: CGPoint(x: 0, y: 800), point2: point, point3: CGPoint(x: 0, y: 1080)))
    }
    tmpLayer = createTriangleLayer(path: beziers.first!, fillColor: UIColor.green)
    backgroundView.layer.addSublayer(tmpLayer)
    layers.append(tmpLayer)
    animatedBeziers.append(AnimatableElement(beziers: beziers, layer: tmpLayer))
    
    beziers.removeAll()
    for point in spiralPoints {
      beziers.append(createBezierPath(point1: CGPoint(x: 0, y: 1080), point2: point, point3: CGPoint(x: 600, y: 1080)))
    }
    tmpLayer = createTriangleLayer(path: beziers.first!, fillColor: UIColor.gray)
    backgroundView.layer.addSublayer(tmpLayer)
    layers.append(tmpLayer)
    animatedBeziers.append(AnimatableElement(beziers: beziers, layer: tmpLayer))
    
    beziers.removeAll()
    for point in spiralPoints {
      beziers.append(createBezierPath(point1: point, point2: CGPoint(x: 600, y: 300), point3: CGPoint(x: 800, y: 800)))
    }
    tmpLayer = createTriangleLayer(path: beziers.first!, fillColor: UIColor.black)
    backgroundView.layer.addSublayer(tmpLayer)
    layers.append(tmpLayer)
    animatedBeziers.append(AnimatableElement(beziers: beziers, layer: tmpLayer))
    
    for elem in animatedBeziers {
      
      let group = CAAnimationGroup()
      var animations: [CAAnimation] = []
      
      for i in 0...elem.beziers.count-2 {
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = elem.beziers[i].cgPath
        animation.toValue = elem.beziers[i+1].cgPath
        animation.duration = 1.0
        animation.beginTime = CFTimeInterval(1 * i)
        animations.append(animation)
      }
      
      group.animations = animations
      group.repeatCount = .infinity
      group.duration = CFTimeInterval(animations.count)
      group.isRemovedOnCompletion = false
      group.fillMode = kCAFillModeForwards
      group.autoreverses = true
      
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
