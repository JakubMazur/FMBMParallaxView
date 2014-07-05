//
//  ContentManager.swift
//  FMBMParallaxView
//
//  Created by Pawel on 05.07.2014.
//  Copyright (c) 2014 Kettu Jakub Mazur. All rights reserved.
//

import UIKit

class ContentManager {
    struct Static {
        static var token : dispatch_once_t = 0
        static var instance : ContentManager?
    }
    
    class var instance: ContentManager {
    dispatch_once(&Static.token) {  Static.instance = ContentManager() }
        return Static.instance!
    }
    
    init(){
        assert(Static.instance == nil, "Singleton already initialized!")
    }
    
    func getDataUrls() -> (urls: String[]) {
        var urls:String[]
        urls = String[]()
        for val in 1..100
            {
                urls.append("http://lorempixel.com/400/200/sports/\(val)/")
                println("http://lorempixel.com/400/200/sports/\(val)/")
            }
        return urls;
    }
    
    func downloadData (completionClosure: (data :NSData) ->()){
        let session = NSURLSession.sharedSession()
        let url:NSURL = NSURL.URLWithString("http://placekitten.com/g/200/300")
        let urlRequest = NSURLRequest(URL:url)
        session.dataTaskWithRequest(urlRequest,
            completionHandler: {(data: NSData!,
                response: NSURLResponse!,
                error: NSError!) in
                println(data)
                println(response)
                println(error)
                completionClosure(data: data)
            }).resume()
    }
}