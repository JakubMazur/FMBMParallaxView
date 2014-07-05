//
//  ExampleViewController.swift
//  FMBMParallaxView
//
//  Created by Kamil Burczyk on 05.07.2014.
//  Copyright (c) 2014 Kettu Jakub Mazur. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var imageView: FMBMImageView
    @IBOutlet var scrollView: UIScrollView

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.clipsToBounds = true
        scrollView.contentSize = CGSizeMake(400, 400)
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        let deltaX = scrollView.contentSize.width - scrollView.frame.width
        let deltaY = scrollView.contentSize.height - scrollView.frame.height
        
        imageView.horizontalOffset = scrollView.contentOffset.y / deltaX
        imageView.verticalOffset = scrollView.contentOffset.x / deltaY
    }

}
