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
        
        for (var i=0;i<500;i++) {
            let foo = "http://lorempixel.com/400/200/sports/" + String(i) + "/"
            imageDataSource.append(foo)
            println(imageDataSource[i])
        }
        
        
        var manager : ContentManager
        manager = ContentManager()
        imageDataSource = manager.getDataUrls()
        
        collectionView.reloadData()

    }
    
//MARK: - CollectionView delegate
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return imageDataSource.count;
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        
        var cell = collectionView .dequeueReusableCellWithReuseIdentifier("MyExampleCell", forIndexPath: indexPath) as ExampleCollectionViewCell
        //cell.imageView.image = UIImage(named:imageDataSource[indexPath.row])
        var manager : ContentManager
        manager = ContentManager()
        manager.downloadDataWithUrlString (imageDataSource[indexPath.row]) { (data: NSData) in
            dispatch_async(dispatch_get_main_queue()) {
                cell.downloadedImage.image = UIImage(data: data)
                
            }
        }
        cell.backgroundColor = UIColor.redColor()
        return cell
    }
    

}

