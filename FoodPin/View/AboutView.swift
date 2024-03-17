//
//  AboutView.swift
//  FoodPin
//
//  Created by donghs on 2024/3/17.
//

import SwiftUI

struct AboutView: View {
    enum WebLink: String {
        case rateUs = "https://www.apple.com/ios/app-store"
        case feedback = "https://www.appcoda.com/contact"
        case twitter = "https://www.twitter.com/appcodamobile"
        case facebook = "https://www.facebook.com/appcodamobile"
        case instagram = "https://www.instagram.com/appcodadotcom"
    }
    
    var body: some View {
        NavigationStack {
            List {
                Image("about")
                    .resizable()
                    .scaledToFit()
                
                Section {
                    Link(destination: URL(string: WebLink.rateUs.rawValue)!, label: {
                        Label("Rate us on App Store", image: "store")
                            .foregroundStyle(.primary)
                    })
                    
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
