//
//  ContentView.swift
//  FoodPin
//
//  Created by Simon Ng on 26/9/2023.
//

import SwiftUI

struct RestaurantListView: View {
    @State var restaurantIsFavorites = Array(repeating: false, count: 21)
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var body: some View {
        List {
            ForEach(restaurantNames.indices, id: \.self) { index in
//                BasicTextImageRow(
                                    FullImageRow(
                    imageName: restaurantImages[index],
                    name: restaurantNames[index],
                    type: restaurantTypes[index],
                    location: restaurantLocations[index],
                    isFavorite: $restaurantIsFavorites[index]
                )
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct FullImageRow: View {
    @State private var showOptions = false
    @State private var showError = false
    var imageName: String
    var name: String
    var type: String
    var location: String
    @Binding var isFavorite: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.system(.title2, design: .rounded))
                    
                    Text(type)
                        .font(.system(.body, design: .rounded))
                    
                    Text(location)
                        .font(.system(.body, design: .rounded))
                        .foregroundStyle(.gray)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                if isFavorite {
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.yellow)
                        .padding(.horizontal)
                }
            }
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .confirmationDialog("What do you want to do?", isPresented: $showOptions, titleVisibility: .visible) {
            
            Button("Reserve a table") {
                self.showError.toggle()
            }
            
            Button("Mark as favorite") {
                self.isFavorite.toggle()
            }
        }
        .alert("Not yet available", isPresented: $showError) {
            Button("OK") {}
        } message: {
            Text("Sorry, this feature is not available yet. Please retry later.")
        }
    }
}

struct BasicTextImageRow: View {
    @State private var showOptions = false
    @State private var showError = false

    var imageName: String
    var name: String
    var type: String
    var location: String
    @Binding var isFavorite: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(imageName)
                .resizable()
                .frame(width: 120, height: 118)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(.title2, design: .rounded))
                
                Text(type)
                    .font(.system(.body, design: .rounded))
                
                Text(location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.gray)
            }
            
            if isFavorite {
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
            }
        }
        .onTapGesture {
            showOptions.toggle()
        }
//        .actionSheet(isPresented: $showOptions, content: {
//            ActionSheet(
//                title: Text("Select a color"),
//                buttons: [
//                    .default(Text("Red")) {
//                    },
//                    .default(Text("Green")) {
//                    },
//                
//                    .default(Text("Blue")) {
//                    },
//                ]
//            )
//        })
        .confirmationDialog("What do you want to do?", isPresented: $showOptions, titleVisibility: .visible) {
            
            Button("Reserve a table") {
                self.showError.toggle()
            }
            
            Button("Mark as favorite") {
                self.isFavorite.toggle()
            }
        }
        .alert("Not yet available", isPresented: $showError) {
            Button("OK") {}
        } message: {
            Text("Sorry, this feature is not available yet. Please retry later.")
        }
    }
}

#Preview {
    RestaurantListView()
}

#Preview("Dark mode") {
    RestaurantListView()
        .preferredColorScheme(.dark)
}


#Preview("BasicTextImageRow", traits: .sizeThatFitsLayout) {
    BasicTextImageRow(imageName: "cafedeadend", name: "CafeDeadend", type: "Cafe", location: "Hong Kong", isFavorite: .constant(true))
}

#Preview("FullImageRow", traits: .sizeThatFitsLayout) {
    FullImageRow(imageName: "cafedeadend", name: "CafeDeadend", type: "Cafe", location: "Hong Kong", isFavorite: .constant(true))
}
