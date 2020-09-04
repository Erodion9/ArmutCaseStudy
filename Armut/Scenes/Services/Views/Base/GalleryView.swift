//
//  BaseGalleryView.swift
//  Armut
//
//  Created by Deniz Mavi on 4.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

protocol GalleryViewProtocol: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var contents: [Displayable]? { get set }
    var collectionView: UICollectionView! { get set }
    var reuseIdentifier: String? { get set }
    
    /// Set contents of the gallery and reload data.
    /// - Parameter contents: contents to set.
    func setContents(contents: [Displayable])
}

class GalleryView: UIView, GalleryViewProtocol {
    
    var contents: [Displayable]?
    @IBOutlet internal var collectionView: UICollectionView!
    var reuseIdentifier: String?
    
    
    override func layoutSubviews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func setContents(contents: [Displayable]) {
        self.contents = contents
        collectionView.reloadData()
    }
}
