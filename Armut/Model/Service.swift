//
//  Service.swift
//  Armut
//
//  Created by Deniz Mavi on 3.09.2020.
//  Copyright © 2020 Deniz Mavi. All rights reserved.
//

struct Service: Displayable {

    var id: Int
    var name: String
    var pro_count: Int
    var image_url: String
    var service_id: Int?
    var long_name: String?
    var average_rating: Float?
    var completed_jobs_on_last_month: Int?
    
    //Todo: Handle invalid image_url's
}
