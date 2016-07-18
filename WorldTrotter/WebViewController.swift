//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Luis Arias on 17/07/16.
//  Copyright © 2016 Luis Arias. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Web cargada")
        let url = NSURL(string: "https://www.bignerdranch.com")
        let requestObj = NSURLRequest(URL: url!)
        
        self.webView.loadRequest(requestObj)
    }

}
