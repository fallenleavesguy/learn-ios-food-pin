//
//  DiscoverView.swift
//  FoodPin
//
//  Created by donghs on 2024/3/24.
//

import SwiftUI
import CloudKit

struct DiscoverView: View {
    @State private var cloudStore: RestaurantCloudStore = RestaurantCloudStore()

    var body: some View {
        NavigationStack {
            List(cloudStore.restaurants, id: \.recordID) { restaurant in
                HStack {
                    AsyncImage(url: getImageURL(restaurant: restaurant)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.purple.opacity(0.1)
                    }
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Text(restaurant.object(forKey: "name") as! String)
                }
            }
            .listStyle(.inset)
            .task {
                do {
                    try await cloudStore.fetchRestaurants()
                } catch {
                    print(error)
                }
            }
            .navigationTitle("Discover")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    private func getImageURL(restaurant: CKRecord) -> URL? {
        guard let image = restaurant.object(forKey: "image"),
              let imageAsset = image as? CKAsset else {
            return nil
        }
        
        print("image url: \(imageAsset.fileURL?.description)")
        return imageAsset.fileURL
    }
}

#Preview {
    DiscoverView()
}
