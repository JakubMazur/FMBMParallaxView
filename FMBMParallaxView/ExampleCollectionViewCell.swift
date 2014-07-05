//
//  ExampleCollectionViewCell.swift
//  FMBMParallaxView
//
//  Created by Kuba Mazur on 05.07.2014.
//  Copyright (c) 2014 Kettu Jakub Mazur. All rights reserved.
//

import UIKit

class ExampleCollectionViewCell: UICollectionViewCell {

    @IBOutlet var downloadedImage : FMBMImageView
    
    init(frame: CGRect) {
        super.init(frame: frame)
        NSNotificationCenter .defaultCenter().addObserver(self, selector: "changeImageOffset:", name: "scrollOffsetChanged", object: nil)
    }
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        NSNotificationCenter .defaultCenter().addObserver(self, selector: "changeImageOffset:", name: "scrollOffsetChanged", object: nil)
    }
    
    deinit {
        NSNotificationCenter .defaultCenter().removeObserver(self)
    }
    
    func changeImageOffset(notification: NSNotification) {
        let deltaX = notification.userInfo.objectForKey("xOffset").floatValue
        let deltay = notification.userInfo.objectForKey("yOffset").floatValue
        downloadedImage.horizontalOffset = deltaX
        downloadedImage.verticalOffset = deltay

    }
    
}
