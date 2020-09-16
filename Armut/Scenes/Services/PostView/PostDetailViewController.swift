//
//  PostViewController.swift
//  Armut
//
//  Created by Deniz Mavi on 5.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit
import WebKit

final class PostDetailViewController: BaseViewController {
    
    @IBOutlet private weak var webView: WKWebView!
    private var viewModel = PostDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = passedParameters as? URL {
            loadWebpage(url: url)
        }
    }
}

//MARK: - View Configuration
extension PostDetailViewController {
    
    func loadWebpage(url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
