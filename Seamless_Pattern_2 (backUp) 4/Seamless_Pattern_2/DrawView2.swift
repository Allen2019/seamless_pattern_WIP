//
//  DrawView2.swift
//  Seamless_Pattern_2
//
//  Created by allen01px2019 on 2018/12/10.
//  Copyright © 2018 Allen. All rights reserved.
//

import UIKit

class DrawView2: UIView, drawViewProtocol {
    
    var lines: [Line] = [] {didSet { self.setNeedsDisplay()}}
    var lastPoint: CGPoint!
    
    var color: CGColor = UIColor.blue.cgColor
    var lineWidth: CGFloat = 6.0
    var opacity: CGFloat = 1.0
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    
    
    override func draw(_ rect: CGRect) {
        
        
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath()
        for line in lines {
            
            context?.move(to: CGPoint(x: line.start.x, y: line.start.y))
//            print("line.start.x: \(line.start.x)")
            context?.addLine(to: CGPoint(x: line.end.x, y: line.end.y))
//            print("line.end.x: \(line.end.x)")
            
        }
        
        
        
        context?.setLineCap(CGLineCap.round)
        context?.setStrokeColor(color)
        context?.setLineWidth(lineWidth)
        context?.setAlpha(opacity)
        //context?.setShadow(offset: CGSize.init(width: 3, height: 3), blur: 0.5)
        context?.strokePath()
        
    
    }
}
