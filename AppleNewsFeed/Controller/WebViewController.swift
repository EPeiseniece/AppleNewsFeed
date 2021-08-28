//
//  WebViewController.swift
//  AppleNewsFeed
//
//  Created by elina.peiseniece on 28/08/2021.
//

import UIKit
import WebKit


class WebViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    
    var urlString = String()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Web"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("navigation starts")
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("navigation stops")
    }


}
