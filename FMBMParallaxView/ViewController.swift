//
//  ViewController.swift
//  FMBMParallaxView
//
//  Created by Kuba Mazur on 05.07.2014.
//  Copyright (c) 2014 Kettu Jakub Mazur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var manager:ContentManager
        manager = ContentManager()
        manager.getDataUrls()
        
        manager.downloadDataWithUrlString ("http://lorempixel.com/400/200/sports/1/") { (data: NSData) in
            dispatch_async(dispatch_get_main_queue()) {

            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

