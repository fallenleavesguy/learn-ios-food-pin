//
//  AboutView.swift
//  FoodPin
//
//  Created by donghs on 2024/3/17.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            List {
                Image("about")
                    .resizable()
                    .scaledToFit()
                
                Section {
                    Label("Rate us on App Store", image: "store")
                    
                    Label("Tell us your feedback", image: "chat")
                }
                
                Section {
                    Label("Twitter", image: "twitter")
                    
                    Label("Facebook", image: "facebook")
                    
                    Label("Instagram", image: "instagram")
                }
            }
            .listStyle(.grouped)
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    AboutView()
}
