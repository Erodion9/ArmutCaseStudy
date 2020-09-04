//
//  GalleryView.swift
//  Armut
//
//  Created by Deniz Mavi on 4.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import UIKit

protocol GalleryView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var contents: [Displayable]? { get set }
}
