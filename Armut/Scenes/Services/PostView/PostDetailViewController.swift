//
//  PostViewController.swift
//  Armut
//
//  Created by Deniz Mavi on 5.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import Foundation

final class PostDetailViewController: BaseViewController {
    
    var viewModel = PostDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = passedParameters as? URL {
            print("Will show URL: \(url.absoluteString)")
        }
    }
}
