//
//  APIViewController.swift
//  Jokes
//
//  Created by Александр Уткин on 05.03.2020.
//  Copyright © 2020 Александр Уткин. All rights reserved.
//

import UIKit
import WebKit

class APIViewController: UIViewController {
        
    @IBOutlet weak var webView: WKWebView!
    
    private let mainUrl = "http://www.icndb.com/api"    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: mainUrl) else { return }
        
        self.webView.load(URLRequest(url: url))
    }
}
