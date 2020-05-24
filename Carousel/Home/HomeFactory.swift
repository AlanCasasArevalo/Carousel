//
//  HomeFactory.swift
//  Carousel
//
//  Created by Alan Casas on 24/05/2020.
//  Copyright © 2020 Alan Casas. All rights reserved.
//

import Foundation

class HomeFactory {
    
    let imageArray = ["Alan&Sol", "Bibi&Arik", "BibiExplicando", "BibiSenalando1", "BibiSenalando2", "Los3"]

    var interestArray = [InterestEntity]()
    
    func getAllInterest () -> [InterestEntity] {
        
        let firstEntity = InterestEntity(featuredImageView: "Alan&Sol", interestTitleLabel: "Mirando al sol")
        let secondEntity = InterestEntity(featuredImageView: "Bibi&Arik", interestTitleLabel: "Bibi y el chuchillo")
        let thistEntity = InterestEntity(featuredImageView: "BibiExplicando", interestTitleLabel: "BibiSenalando1")
        let forthEntity = InterestEntity(featuredImageView: "BibiSenalando1", interestTitleLabel: "Bibi Señalando algo")
        let fithEntity = InterestEntity(featuredImageView: "BibiSenalando2", interestTitleLabel: "Bibi Señalando algo otra vez")
        let sixthEntity = InterestEntity(featuredImageView: "Los3", interestTitleLabel: "Los 3 en la montaña")
        
        interestArray.append(firstEntity)
        interestArray.append(secondEntity)
        interestArray.append(thistEntity)
        interestArray.append(forthEntity)
        interestArray.append(fithEntity)
        interestArray.append(sixthEntity)

        return interestArray
    }
    
}
