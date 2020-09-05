//
//  ServicesView.swift
//  Armut
//
//  Created by Deniz Mavi on 5.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

final class ServicesView: GalleryView {
    
    private enum Constants {
        
        static let reuseIdentifier = "ServiceCell"
        static let nibName = "ServiceCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: Constants.nibName, bundle: nil), forCellWithReuseIdentifier: Constants.reuseIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as! ServiceCell
        if let service = contents?[indexPath.row] as? Service {
            cell.service = service
            cell.configureView()
        }
        return cell
    }
}
