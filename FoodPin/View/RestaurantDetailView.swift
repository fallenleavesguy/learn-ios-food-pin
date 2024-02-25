//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by donghs on 2024/2/26.
//

import SwiftUI

struct RestaurantDetailView: View {
    var restaurant: Restaurant
    var body: some View {
        ZStack(alignment: .top) {
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .ignoresSafeArea()
            
            Color.black
                .frame(height: 100)
                .opacity(0.8)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                .overlay {
                    VStack(spacing: 5) {
                        Text(restaurant.name)
                        Text(restaurant.type)
                        Text(restaurant.location)
                    }
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    RestaurantDetailView(restaurant: Restaurant(name: "Cafe Deadend", type: "Cafe", location: "Hong Kong", image: "cafedeadend", isFavorite: true))
}
