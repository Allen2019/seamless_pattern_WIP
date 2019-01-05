//
//  FirstViewController.swift
//  Seamless_Pattern_2
//
//  Created by allen01px2019 on 2018/10/21.
//  Copyright © 2018 Allen. All rights reserved.
//

import UIKit

var fVC = FirstViewController()

class FirstViewController: UIViewController {

    
    @IBOutlet weak var drawView: DrawView!
    @IBOutlet weak var drawView2: DrawView2!
    
    var d: CGFloat = 0
    
    var delegate: drawViewProtocol?
    var delegate2: drawViewProtocol?
    
    func updateArray()
    {
//        self.delegate2?.lines = self.delegate?.lines ?? []
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fVC = self
        
        delegate = drawView
        delegate2 = drawView2
        
        d = drawView.frame.width
        
    }

    @IBAction func clearButton(_ sender: Any) {
        
    drawView.lines = []
    
    
    drawView.setNeedsDisplay()
    
    }
    
//    func view1LinesToView2Lines (_ LineArray: [Line])
//    {
//        drawView2.lines = LineArray
//        drawView2.setNeedsDisplay()
//    }
    
}

//hello!

