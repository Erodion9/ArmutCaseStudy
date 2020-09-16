//
//  ViewController.swift
//  Armut
//
//  Created by Deniz Mavi on 3.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

protocol GalleryViewDelegate: class {
    
    func showServiceDetail(id: Int, image: UIImage)
    func showPostLink(url: URL)
}

final class ServicesViewController: BaseViewController {
    
    private var homepageData = HomePageData()
    private var viewModel = ServicesViewModel()
    @IBOutlet private weak var trendingServicesView: ServicesView!
    @IBOutlet private weak var otherView: ServicesView!
    @IBOutlet private weak var postsView: PostsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

//MARK: - View Configuration
private extension ServicesViewController {
    
    func configureView() {
        viewModel.stateChangeHandler = { [weak self] change in
        self?.apply(change: change)
        }
        viewModel.loadHomePageData()
        
        trendingServicesView.delegate = self
        otherView.delegate = self
        postsView.delegate = self
    }

    func reloadHomepageData(data: HomePageData) {
        homepageData = data
        DispatchQueue.main.async {
            self.updateGalleries()
        }
    }
    
    func updateGalleries() {
        trendingServicesView.setContents(contents: self.homepageData.trending ?? [Displayable]())
        otherView.setContents(contents: self.homepageData.other ?? [Displayable]())
        postsView.setContents(contents: self.homepageData.posts ?? [Displayable]())
    }
}

//MARK: - GalleryViewDelegate
extension ServicesViewController: GalleryViewDelegate {

    func showServiceDetail(id: Int, image: UIImage) {
        let passedParameters = (id: id, image: image)
        show(storyboard: .serviceDetail, style: .pageSheet, passedParameters: passedParameters)
    }
    
    func showPostLink(url: URL) {
        show(storyboard: .postDetail, style: .formSheet, passedParameters: url)
    }
}

// MARK: - State Change Handling
private extension ServicesViewController {

    func apply(change: ServicesViewModel.Change) {
        switch change {
        case .reloadServices(homepageData: let homepageData):
            self.reloadHomepageData(data: homepageData)
        }
    }
}

//MARK: - Routing
extension ServicesViewController: Routable {

    enum StoryboardIdentifier: String {
        case serviceDetail = "ServiceDetail"
        case postDetail = "PostDetail"
    }
}
