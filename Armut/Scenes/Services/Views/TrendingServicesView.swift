//
//  TrendingServicesView.swift
//  Armut
//
//  Created by Deniz Mavi on 4.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class TrendingServicesView: GalleryView {

    private enum Constants {
        
        static let reuseIdentifier = "TrendingServicesCell"
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier ?? "", for: indexPath)
        cell.backgroundColor = .blue
        cell.frame.size = CGSize(width: 100, height: 100)
        return cell
    }
    
    override func layoutSubviews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        reuseIdentifier = Constants.reuseIdentifier
        collectionView.reloadData()
    }
}
