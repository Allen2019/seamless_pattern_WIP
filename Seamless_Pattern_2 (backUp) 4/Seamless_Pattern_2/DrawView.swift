//
//  DrawView.swift
//  Seamless_Pattern_2
//
//  Created by allen01px2019 on 2018/10/21.
//  Copyright © 2018 Allen. All rights reserved.
//

import UIKit

class DrawView: UIView, drawViewProtocol {

    var lines: [Line] = []
    var lines2: [Line] = []
    var lastPoint: CGPoint!
    var lastPoint2: CGPoint!
    
    var color: CGColor = UIColor.black.cgColor
    var lineWidth: CGFloat = 5.0
    var opacity: CGFloat = 1.0
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            lastPoint = location
        }
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var touch : UITouch!
        touch = touches.first
        var newPoint = touch.location(in: self)
        
        if (newPoint.x <= fVC.d) && (newPoint.y <= fVC.d) && (newPoint.x >= 0) && (newPoint.y>=0)
        {
            lines.append(Line(start: lastPoint, end: newPoint))
            lastPoint = newPoint
            lastPoint2 = touch.location(in: self)
        }
        else if newPoint.x < 0 && newPoint.y < 0 //top left corner
        {
            if lastPoint2 == nil
            {
                lastPoint2 = lastPoint
            }
            
            if lastPoint2.x < fVC.d/2
            {
                lastPoint2.x += fVC.d
            }
            
            if lastPoint2.x > fVC.d/2
            {
                lastPoint2.x -= fVC.d
            }
            lines2.append(Line(start: CGPoint(x: lastPoint2.x, y: lastPoint2.y), end: newPoint))
            
            lastPoint2 = newPoint
            lastPoint = touch.location(in: self)
        }
        else if newPoint.x > fVC.d
        {
            newPoint = CGPoint(x: newPoint.x-fVC.d, y: newPoint.y)
            
            if lastPoint2 == nil
            {
                lastPoint2 = lastPoint
            }
            if lastPoint2.x > fVC.d/2
            {
                lastPoint2.x -= fVC.d
            }
            
            if lastPoint2.y < fVC.d/2
            {
                lastPoint2.y += fVC.d
            }
            
            lines2.append(Line(start: CGPoint(x: lastPoint2.x, y: lastPoint2.y), end: newPoint))
            
            lastPoint2 = newPoint
            lastPoint = touch.location(in: self)
        }
        else if newPoint.x < 0
        {
            newPoint = CGPoint(x: newPoint.x+fVC.d, y: newPoint.y)
            
            if lastPoint2 == nil
            {
                lastPoint2 = lastPoint
            }
            if lastPoint2.x < fVC.d/2
            {
                lastPoint2.x += fVC.d
            }
            lines2.append(Line(start: CGPoint(x: lastPoint2.x, y: lastPoint2.y), end: newPoint))
            
            lastPoint2 = newPoint
            lastPoint = touch.location(in: self)
        }
        else if newPoint.y > fVC.d
        {
            newPoint = CGPoint(x: newPoint.x, y: newPoint.y-fVC.d)
            
            if lastPoint2 == nil
            {
                lastPoint2 = lastPoint
            }
            if lastPoint2.y > fVC.d/2
            {
                lastPoint2.y -= fVC.d
            }
            lines2.append(Line(start: CGPoint(x: lastPoint2.x, y: lastPoint2.y), end: newPoint))
            
            lastPoint2 = newPoint
            lastPoint = touch.location(in: self)
        }
        else if newPoint.y < 0
        {
            newPoint = CGPoint(x: newPoint.x, y: newPoint.y+fVC.d)
            
            if lastPoint2 == nil
            {
                lastPoint2 = lastPoint
            }
            if lastPoint2.y < fVC.d/2
            {
                lastPoint2.y += fVC.d
            }
            lines2.append(Line(start: CGPoint(x: lastPoint2.x, y: lastPoint2.y), end: newPoint))
            
            lastPoint2 = newPoint
            lastPoint = touch.location(in: self)
        }
        
        
        
//        FirstViewController.view1LinesToView2Lines(lines)
        fVC.updateArray()
        self.setNeedsDisplay()
    }
    
    //Probably just need to modify the lines.append /n lastPoint = newPoint part to fix wrapping
    
    override func draw(_ rect: CGRect) {
       
       
        let context = UIGraphicsGetCurrentContext()
        context?.beginPath()
        for line in lines {

            context?.move(to: CGPoint(x: line.start.x, y: line.start.y))
//                print("line.start.x: \(line.start.x), line.start.y: \(line.start.y)")
            context?.addLine(to: CGPoint(x: line.end.x, y: line.end.y))
//                print("line.end.x: \(line.end.x), line.end.y: \(line.end.y)")
        
        }
        for line in lines2 {
            
            context?.move(to: CGPoint(x: line.start.x, y: line.start.y))
            print("line.start.x2: \(line.start.x), line.start.y2: \(line.start.y)")
            context?.addLine(to: CGPoint(x: line.end.x, y: line.end.y))
            print("line.end.x2: \(line.end.x), line.end.y2: \(line.end.y)")
            
        }
        
        
        
        context?.setLineCap(CGLineCap.round)
        context?.setStrokeColor(color)
        context?.setLineWidth(lineWidth)
        context?.setAlpha(opacity)
        //context?.setShadow(offset: CGSize.init(width: 3, height: 3), blur: 0.5)
        context?.strokePath()
        

        
        /*
        //--
        // Draw a red line
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.move(to: CGPoint(x: 0, y: 0))
        context?.addLine(to: CGPoint(x: 100, y: 100))
        context?.strokePath()
        
        // Draw a transparent green Circle
        context?.setStrokeColor(UIColor.green.cgColor)
        context?.setAlpha(0.5)
        context?.setLineWidth(10.0)
        context?.addEllipse(in: CGRect(x: 0, y: 0, width: 100, height: 100))
        context?.drawPath(using: .stroke) // or .fillStroke if need filling
        
        //DrawOnImage(startingImage: context)
 */
        

        
    }
 
//    func DrawOnImage(startingImage: UIImage) -> UIImage {
//
//        // Create a context of the starting image size and set it as the current one
//        UIGraphicsBeginImageContext(startingImage.size)
//
//        // Draw the starting image in the current context as background
//        startingImage.draw(at: CGPoint.zero)
//
//            // Get the current context
//            let context = UIGraphicsGetCurrentContext()!
//
//            // Draw a red line
//            context.setLineWidth(2.0)
//            context.setStrokeColor(UIColor.red.cgColor)
//            context.move(to: CGPoint(x: 100, y: 100))
//            context.addLine(to: CGPoint(x: 200, y: 200))
//            context.strokePath()
//
//            // Draw a transparent green Circle
//            context.setStrokeColor(UIColor.green.cgColor)
//            context.setAlpha(0.5)
//            context.setLineWidth(10.0)
//            context.addEllipse(in: CGRect(x: 100, y: 100, width: 100, height: 100))
//            context.drawPath(using: .stroke) // or .fillStroke if need filling
//
//        // Save the context as a new UIImage
//        let myImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        // Return modified image
//        return myImage!
//    }
    

}

//hi
// hi 2
// hi 3 ??
