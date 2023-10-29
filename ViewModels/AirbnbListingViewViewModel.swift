//
//  AirbnbListingViewViewModel.swift
//  Airbnb
//
//  Created by Felix Martinez Casadiego on 29/10/23.
//

import Foundation

final class AirbnbListingViewViewModel: ObservableObject {
    private let service = APIService()
    
    @Published var listings: [AirbnbListing] = []
    
    public func fetchListings() {
        service.getListings { [weak self] result in
            switch result {
            case .success(let models): self?.listings = models
            case .failure: break
            }
        }
    }
}
