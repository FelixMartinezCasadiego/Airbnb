//
//  AirbnbListingCardView.swift
//  Airbnb
//
//  Created by Felix Martinez Casadiego on 28/10/23.
//

import SwiftUI

struct AirbnbListingCardView: View {
    let model: AirbnbListing
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: model.thumbnail_url ?? "")) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "building.2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                default:
                    Image(systemName: "building.2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .clipped()
                
            VStack {
                Text(model.name ?? "Listing")
                    .lineLimit(1)
                    .font(.title3)
                    .bold()
                
                Text(model.description ?? "Listing")
                    .lineLimit(3)
                    .foregroundColor(.gray)
                    .font(.body)
            }
        }
    }
}


