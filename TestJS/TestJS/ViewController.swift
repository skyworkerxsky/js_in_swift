//
//  ViewController.swift
//  TestJS
//
//  Created by Алексей Макаров on 28.09.2022.
//

import UIKit
import WebKit

class ViewController: UIViewController {
   
    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        
        let contentController = WKUserContentController()
        contentController.add(self, name: "callbackHandler")
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webView = WKWebView(frame: .zero, configuration: config)
        view = webView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // use local html
        let path = Bundle.main.path(forResource: "index", ofType: "html")
        let url = URL(fileURLWithPath: path!)
        let req = URLRequest(url: url)
        webView!.load(req)
    }

}

extension ViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if (message.name == "callbackHandler"){
            print("\(message.body)")
        }
    }
}

