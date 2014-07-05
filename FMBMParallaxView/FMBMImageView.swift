//
//  FMBMImageView.swift
//  FMBMParallaxView
//
//  Created by Kamil Burczyk on 05.07.2014.
//  Copyright (c) 2014 Kettu Jakub Mazur. All rights reserved.
//

import UIKit

class FMBMImageView: UIImageView {

    var clipping: Float
    var horizontalOffset: Float {
        didSet {
            let maxV = 1 -  self.frame.size.width / super.image.size.width
            let maxH = 1 -  self.frame.size.height / super.image.size.height
            
            self.layer.contentsRect = CGRectMake(min(maxV, max(0, verticalOffset)), min(maxH, max(0, horizontalOffset)), 1, 1)
        }
    }
    
    var verticalOffset: Float {
        didSet {
            let maxV = 1 -  self.frame.size.width / super.image.size.width
            let maxH = 1 -  self.frame.size.height / super.image.size.height
            
            self.layer.contentsRect = CGRectMake(min(maxV, max(0, verticalOffset)), min(maxH, max(0, horizontalOffset)), 1, 1)
        }
    }
    
    override var image: UIImage! {
        get {
            self.layer.contentsRect = CGRectMake(0, 0, 1, 1)
            return super.image
        }
        set {
            super.image = image
        }
    }
    
    init(frame: CGRect) {
        clipping = 0
        horizontalOffset = 0
        verticalOffset = 0
        
        super.init(frame: frame)
    }
    
    init(coder aDecoder: NSCoder!) {
        clipping = 0
        horizontalOffset = 0
        verticalOffset = 0
        
        super.init(coder: aDecoder)
    }

    init(image: UIImage!) {
        clipping = 0
        horizontalOffset = 0
        verticalOffset = 0
        
        super.init(image: image)
    }

}
