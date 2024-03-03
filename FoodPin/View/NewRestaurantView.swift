//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by donghs on 2024/3/3.
//

import SwiftUI

struct NewRestaurantView: View {
    @State var restaurantName = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("NAME")
                .font(.system(.headline, design: .rounded))
                .foregroundStyle(Color(.darkGray))
            TextField("Fill in the restaurant name", text: $restaurantName)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .padding(.horizontal)
                .padding(10)
                .overlay(
                   RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    NewRestaurantView()
}
