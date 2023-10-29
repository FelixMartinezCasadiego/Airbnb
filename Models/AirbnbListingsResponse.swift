//
//  AirbnbListingsResponse.swift
//  Airbnb
//
//  Created by Felix Martinez Casadiego on 28/10/23.
//

import Foundation

struct AirbnbListingsResponse: Codable {
    let total_count: Int
    let results: [AirbnbListing]
}
