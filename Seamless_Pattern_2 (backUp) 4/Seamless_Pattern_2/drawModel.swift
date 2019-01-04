//
//  drawModel.swift
//  Seamless_Pattern_2
//
//  Created by allen01px2019 on 2018/12/10.
//  Copyright © 2018 Allen. All rights reserved.
//

import Foundation
import UIKit

protocol drawViewProtocol
{
    
    var lines: [Line] {get set}
    
    var color: CGColor {get set}
    var lineWidth: CGFloat {get set}
    var opacity: CGFloat {get set}

}
//maxHeight: CGFloat,
func wrapping (position: CGPoint, maxWidth: CGFloat) -> CGPoint
{
    if position.x > maxWidth
    {
        return CGPoint(x: position.x - maxWidth, y: position.y)
    }
    
    return CGPoint(x: position.x, y: position.y)
}
