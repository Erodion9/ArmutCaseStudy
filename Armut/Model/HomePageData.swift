//
//  HomePageData.swift
//  Armut
//
//  Created by Deniz Mavi on 3.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

import Foundation

struct HomePageData: Codable {
    
    var trending: [Service]?
    var other: [Service]?
    var posts: [Post]?
}
