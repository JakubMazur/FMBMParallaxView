//
//  Resize.swift
//  FMBMParallaxView
//
//  Created by Konrad Muchowicz on 05/07/14.
//  Copyright (c) 2014 Kettu Jakub Mazur. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func resize(cellSize: CGSize, factor: CGFloat)->UIImage{
        var image = UIImage();
        var newImage:UIImage?
        if (cellSize.width/cellSize.height) != (size.width/size.height) {
            
            var width : CGFloat = size.height
            var height : CGFloat = size.width
    
            if cellSize.width>cellSize.height{
                width = cellSize.width * factor
            }else{
                height = cellSize.height * factor
            }
            
            var imageRef = CGImageCreateWithImageInRect(self.CGImage, CGRectMake((size.width-width)/2,(size.height-height)/2,width,height))
            image = UIImage(CGImage:imageRef)
    
            width = cellSize.width * factor
            height = cellSize.height * factor
            let rect = CGRectMake(0, 0, width, height)
            
            UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
            self.drawInRect(rect)
            newImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
        return newImage!
    }
}