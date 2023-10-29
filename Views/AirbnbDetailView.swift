//
//  AirbnbDetailView.swift
//  Airbnb
//
//  Created by Felix Martinez Casadiego on 28/10/23.
//

import SwiftUI

struct AirbnbDetailView: View {
    let model: AirbnbListing
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { proxy in
                ScrollView(.vertical) {
                    // Picture
                    AsyncImage(url: URL(string: model.xl_picture_url ?? "")) { phase in
                        switch phase {
                        case .empty:
                            Image(systemName: "house.lodge.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        default:
                            Image(systemName: "house.lodge.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .frame(width: proxy.frame(in: .global).width, height: proxy.frame(in: .global).width)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    
                    // Info
                    if let price = model.price {
                        Text("Nightly Rate: \(price.formatted(.currency(code: "USD")))")
                    }
                    Text("Name: \(model.name ?? "")")
                        .bold()
                        .padding()
                    Text("Description: \(model.description ?? "")")
                        .padding()
                    Text("Summary: \(model.summary ?? "")")
                        .padding()
                    Text("House rules: \(model.house_rules ?? "Please see house manual.")")
                        .padding()
                    if let space = model.space {
                        Text("Space: \(space)")
                            .padding()
                    }
                   
                    
                    // Host Info
                    Text("About your Host")
                        .font(.title2)
                        .bold()
                    

                    VStack {
                        AsyncImage(url: URL(string: model.host_picture_url ?? "")) { phase in
                                switch phase {
                                case .empty:
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                default:
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                            .frame(width: 75, height: 75)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                        
                        Text(model.host_name ?? "")
                            .bold()
                    }
                    .padding()
                    
                    Text("Hosting since: \(model.host_since)")
                }
                .frame(maxWidth: proxy.frame(in: .global).width)
            }
        }
        .navigationTitle(model.name ?? "Listing")
    }
}

