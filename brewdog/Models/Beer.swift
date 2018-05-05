//
//  Ingredients.swift
//  brewdog
//
//  Created by Lucas Correa on 05/05/2018.
//  Copyright © 2018 SiriusCode. All rights reserved.
//

import Foundation

class Beer: Codable {
    
    let abv: Double?
    let attenuationLevel: Double?
    let boil: Boil?
    let brewersTips: String?
    let contributedBy: String?
    let description: String?
    let ebc: Int?
    let firstBrewed: String?
    let foodPairing: [String]?
    let ibu: Double?
    let id: Int?
    let imageUrl: String?
    let ingredients: Ingredients?
    let method: Method?
    let name: String?
    let ph: Double?
    let srm: Double?
    let tagline: String?
    let targetFg: Int?
    let targetOg: Double?
    let volume: Volume?
    
    enum CodingKeys: String, CodingKey {
        case abv = "abv"
        case attenuationLevel = "attenuation_level"
        case boil = "boil_volume"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
        case description = "description"
        case ebc = "ebc"
        case firstBrewed = "first_brewed"
        case foodPairing = "food_pairing"
        case ibu = "ibu"
        case id = "id"
        case imageUrl = "image_url"
        case ingredients
        case method
        case name = "name"
        case ph = "ph"
        case srm = "srm"
        case tagline = "tagline"
        case targetFg = "target_fg"
        case targetOg = "target_og"
        case volume
    }
    
    init() {
        abv = 0
        attenuationLevel = 0
        boil = nil
        brewersTips = ""
        contributedBy = ""
        description = ""
        ebc = 0
        firstBrewed = ""
        foodPairing = []
        ibu = 0
        id = 0
        imageUrl = ""
        ingredients = nil
        method = nil
        name = ""
        ph = 0.0
        srm = 0
        tagline = ""
        targetFg = 0
        targetOg = 0
        volume = nil
    }
}
