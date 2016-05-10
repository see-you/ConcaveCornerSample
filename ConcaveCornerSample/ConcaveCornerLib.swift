//
//  ConcaveCornerLib.swift
//  ConcaveCornerSample
//
//  Created by see-you on 2016/05/10.
//  Copyright © 2016年 see-you. All rights reserved.
//

import UIKit

func concaveCorners(view: UIView,corners: UIRectCorner, cornerRadius: CGFloat) -> CAShapeLayer {
    
    let mask: CAShapeLayer = CAShapeLayer()
    mask.frame = view.layer.bounds
    let rect = mask.bounds
    
    let halfWidth = CGRectGetWidth(rect) / 2
    let halfHeight = CGRectGetHeight(rect) / 2
    var cornerR = cornerRadius
    if (cornerRadius > halfWidth || cornerRadius > halfHeight) {
        cornerR = min(halfHeight, halfWidth)
    }
    let path = UIBezierPath()
    
    let topLeft = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect))
    if corners == UIRectCorner.TopLeft {
        path.moveToPoint(CGPointMake(topLeft.x, topLeft.y + cornerR))
        path.addArcWithCenter(topLeft, radius: cornerR, startAngle: CGFloat(M_PI_2), endAngle: 0, clockwise: false)
    }else {
        path.moveToPoint(topLeft)
    }
    
    let topRight = CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect))
    if corners == UIRectCorner.TopRight {
        path.addLineToPoint(CGPointMake(topRight.x - cornerR, topRight.y))
        path.addArcWithCenter(topRight, radius: cornerR, startAngle: CGFloat(M_PI), endAngle: CGFloat(M_PI_2), clockwise: false)
    }else {
        path.addLineToPoint(topRight)
    }
    
    let bottomRight = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect))
    if corners == UIRectCorner.BottomRight {
        path.addLineToPoint(CGPointMake(bottomRight.x, bottomRight.y - cornerR))
        path.addArcWithCenter(bottomRight, radius: cornerR, startAngle: CGFloat(M_PI_2 * 3), endAngle: CGFloat(M_PI), clockwise: false)
    }else {
        path.addLineToPoint(bottomRight)
    }
    
    let bottomLeft = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect))
    if corners == UIRectCorner.BottomLeft {
        path.addLineToPoint(CGPointMake(bottomLeft.x + cornerR, bottomLeft.y))
        path.addArcWithCenter(bottomLeft, radius: cornerR, startAngle: 0, endAngle: CGFloat(M_PI_2 * 3), clockwise: false)
    }else {
        path.addLineToPoint(bottomLeft)
    }
    
    path.closePath()
    
    mask.path = path.CGPath
    
    return mask
}