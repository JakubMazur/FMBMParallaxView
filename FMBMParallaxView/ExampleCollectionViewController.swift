//
//  ViewController.swift
//  FMBMParallaxView
//
//  Created by Kuba Mazur on 05.07.2014.
//  Copyright (c) 2014 Kettu Jakub Mazur. All rights reserved.
//

import UIKit

var imageDataSource = String[]()

class ExampleCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView : UICollectionView
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.connectForData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: - dataConnector
    
    func connectForData() {
        
        var manager = ContentManager()
        imageDataSource = manager.getDataUrls()
        
        collectionView.reloadData()

    }
    
//MARK: - CollectionView delegate
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return imageDataSource.count;
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        
        var cell = collectionView .dequeueReusableCellWithReuseIdentifier("MyExampleCell", forIndexPath: indexPath) as ExampleCollectionViewCell
        cell.downloadedImage.image = UIImage(named: "wwdc 2014.png")
        var manager = ContentManager()
        cell.downloadedImage.image = UIImage(named: "swift.png")
        cell.downloadedImage.alpha = 0.0;
        manager.downloadDataWithUrlString (imageDataSource[indexPath.row]) { (data: NSData) in
            dispatch_async(dispatch_get_main_queue()) {
                cell.downloadedImage.image = UIImage(data: data)
                UIView.animateWithDuration(0.1, animations: {
                    cell.downloadedImage.alpha = 1.0
                    })
            }
        }
        cell.backgroundColor = UIColor.blackColor()
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        let deltaX = scrollView.contentSize.width - scrollView.frame.width
        let deltaY = scrollView.contentSize.height - scrollView.frame.height
        var dict = ["xOffset": scrollView.contentOffset.x / deltaX,"yOffset": scrollView.contentOffset.y / deltaY]
        println("y:\(deltaY)")
        NSNotificationCenter .defaultCenter().postNotificationName("scrollOffsetChanged", object: nil, userInfo: dict)
    }}

