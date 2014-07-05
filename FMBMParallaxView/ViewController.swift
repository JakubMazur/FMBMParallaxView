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
        
        manager.downloadData { (data: NSData) in
                println(data)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

