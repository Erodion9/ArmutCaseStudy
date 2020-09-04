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
        static let nibName = "TrendingServicesCell"
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as! TrendingServicesCell
        //cell.frame.size = CGSize(width: 100, height: 100)
        if let service = contents?[indexPath.row] as? Service {
            cell.service = service
            cell.configureView()
        }
        return cell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: Constants.nibName, bundle: nil), forCellWithReuseIdentifier: Constants.reuseIdentifier)
    }
}
