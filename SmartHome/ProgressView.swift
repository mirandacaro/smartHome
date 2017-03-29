//
//  ProgressView.swift
//  SmartHome
//
//  Created by Gabriela Perez on 29/03/17.
//  Copyright © 2017 Miranda Moreno. All rights reserved.
//

import UIKit

@IBDesignable
class ProgressView: UIView {
    
    // MARK: - Types
    
    struct Constants {
        struct ColorPalette {
            static let teal = UIColor(red:0.27, green:0.80, blue:0.80, alpha:1.0)
            static let darkBlue = UIColor(red:47/255, green:138/255, blue:121/255, alpha:1.0)
            static let gray = UIColor(red:152/255, green:152/255, blue:154/255, alpha:1.0)
        }
    }
    
    // MARK: - Properties
    
    let progressLayer = CAShapeLayer()
    let gradientLayer = CAGradientLayer()
    
    var range: CGFloat = 32
    var curValue: CGFloat = 1{
        didSet {
            animateStroke()
        }
    }
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayers()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        // prepareForInterfaceBuilder is used with @IBDesignable to display
        // this view in the Storyboard.
        setupLayers()
    }
    
    // MARK: - Convenience
    
    func setupLayers() {
        
        // Setup progress layer.
        progressLayer.position = CGPoint.zero
        progressLayer.lineWidth = 3.0
        progressLayer.strokeEnd = 0.0
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.black.cgColor
        
        let radius = CGFloat(self.bounds.height/2) - progressLayer.lineWidth
        let startAngle = CGFloat(-M_PI / 2)
        let endAngle = CGFloat(3 * M_PI / 2)
        let width = self.bounds.width
        let height = self.bounds.height
        let modelCenter = CGPoint(x: width / 2, y: height / 2)
        let path = UIBezierPath(arcCenter: modelCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        progressLayer.path = path.cgPath
        
        layer.addSublayer(progressLayer)
        
        // Setup gradient layer.
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: self.bounds.height)
        gradientLayer.colors = [Constants.ColorPalette.teal.cgColor, Constants.ColorPalette.darkBlue.cgColor, Constants.ColorPalette.gray.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.mask = progressLayer // Use progress layer as mask for gradient layer.
        layer.addSublayer(gradientLayer)
    }
    
    func animateStroke() {
        let fromValue = progressLayer.strokeEnd
        let toValue = curValue / range
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = fromValue
        animation.toValue = toValue
        
        progressLayer.add(animation, forKey: "stroke")
        progressLayer.strokeEnd = toValue
    }
    
}

