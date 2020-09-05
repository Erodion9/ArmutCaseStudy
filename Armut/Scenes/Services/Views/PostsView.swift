 //
//  PostsView.swift
//  Armut
//
//  Created by Deniz Mavi on 4.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

 final class PostsView: GalleryView {
    
    private enum Constants {
        
        static let reuseIdentifier = "PostCell"
        static let nibName = "PostCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: Constants.nibName, bundle: nil), forCellWithReuseIdentifier: Constants.reuseIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as! PostCell
        if let post = contents?[indexPath.row] as? Post {
            cell.post = post
            cell.configureView()
        }
        return cell
    }
}
