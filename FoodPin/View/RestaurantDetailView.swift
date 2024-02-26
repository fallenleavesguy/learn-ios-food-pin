//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by Simon Ng on 28/9/2023.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var restaurant: Restaurant
    
    var body: some View {
//        ZStack(alignment: .top) {
//            Image(restaurant.image)
//                .resizable()
//                .scaledToFill()
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .ignoresSafeArea()
//            
//            Color.black
//                .frame(height: 100)
//                .opacity(0.8)
//                .clipShape(RoundedRectangle(cornerRadius: 20))
//                .padding()
//                .overlay {
//                    VStack(spacing: 5) {
//                        Text(restaurant.name)
//                        Text(restaurant.type)
//                        Text(restaurant.location)
//                    }
//                    .font(.system(.headline, design: .rounded))
//                    .foregroundStyle(.white)
//                }
//        }
        ScrollView {
            VStack(alignment: .leading) {
                Image(restaurant.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 445)
                    .overlay {
                        VStack {
                            Image(systemName: "heart")
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .topTrailing)
                                .padding()
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .padding(.top, 40)
                        }
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text(restaurant.name)
                                .font(.custom("Nunito-Regular", size: 35, relativeTo: .largeTitle))
                                .bold()
                            
                            Text(restaurant.type)
                                .font(.system(.headline, design: .rounded))
                                .background(Color.black)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                        .foregroundStyle(.white)
                        .padding()
                    }
                
                Text(restaurant.description)
                    .padding()
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("ADDRESS")
                            .font(.system(.headline, design: .rounded))
                        
                        Text(restaurant.location)
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        Text("Phone")
                            .font(.system(.headline, design: .rounded))
                        
                        Text(restaurant.phone)
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Text("\(Image(systemName: "chevron.left"))")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        RestaurantDetailView(restaurant: Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", image: "cafedeadend", isFavorite: true))
    }
    .tint(.white)
}
