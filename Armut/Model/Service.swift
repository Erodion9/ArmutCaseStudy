//
//  Service.swift
//  Armut
//
//  Created by Deniz Mavi on 3.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

struct Service: Codable {
    
    var id: Int?
    var service_id: Int?
    var name: String?
    var long_name: String?
    var image_url: String?
    var pro_count: Int?
    var average_rating: Float?
    var completed_jobs_on_last_month: Int?
}
