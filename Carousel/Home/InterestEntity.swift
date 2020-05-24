//
//  Interest.swift
//  Carousel
//
//  Created by Alan Casas on 24/05/2020.
//  Copyright © 2020 Alan Casas. All rights reserved.
//

import Foundation

struct InterestEntity {
    let featuredImageView: String?
    let interestTitleLabel: String?
    
    init(featuredImageView: String?, interestTitleLabel: String?) {
        (self.featuredImageView, self.interestTitleLabel) = (featuredImageView, interestTitleLabel)
    }
    
}
