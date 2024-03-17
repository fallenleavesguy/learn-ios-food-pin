//
//  TutorialView.swift
//  FoodPin
//
//  Created by donghs on 2024/3/17.
//

import SwiftUI

struct TutorialView: View {
    let pageHeadings = [ "CREATE YOUR OWN FOOD GUIDE", "SHOW YOU THE LOCATION", "DISCOVER GREAT RESTAURANTS" ]
    let pageSubHeadings = [ "Pin your favorite restaurants and create your own food guide",
                            "Search and locate your favorite restaurant on Maps",
                            "Find restaurants shared by your friends and other foodies"
                            ]
    let pageImages = [ "onboarding-1", "onboarding-2", "onboarding-3" ]
    @State private var currentPage = 0
    @Environment(\.dismiss) var dismiss
    @AppStorage("hasViewedWalkthrough") var hasViewedWalkthrough: Bool = false
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemIndigo
    }

    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(pageHeadings.indices, id: \.self) { index in
                TutorialPage(image: pageImages[index], heading: pageHeadings[index], subHeading: pageSubHeadings[index])
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .animation(.default, value: currentPage)
        
        VStack(spacing: 20) {
            Button(action: {
                if currentPage < pageHeadings.count - 1 {
                    currentPage += 1
                } else {
                    hasViewedWalkthrough = true
                    dismiss()
                }
            }, label: {
                Text(currentPage == pageHeadings.count - 1 ? "GET STARTED" : "NEXT")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal, 50)
                    .background(Color(.systemIndigo))
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            })

            if currentPage < pageHeadings.count - 1 {
                Button(action: {
                    hasViewedWalkthrough = true
                    dismiss()
                }, label: {
                    Text("Skip")
                        .font(.headline)
                        .foregroundStyle(Color(.darkGray))
                })
            }
        }
        .padding(.bottom)
    }
}

struct TutorialPage: View {
    let image: String
    let heading: String
    let subHeading: String

    var body: some View {
        VStack(spacing: 70) {
           Image(image)
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 10) {
                Text(heading)
                    .font(.headline)
                
                Text(subHeading)
                    .font(.body)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
        .padding(.top)
    }
}

#Preview {
    TutorialView()
}

#Preview("TutorialPage", traits: .sizeThatFitsLayout) {
    TutorialPage(image: "onboarding-1", heading: "CREATE YOUR OWN FOOD GUIDE", subHeading: "Pin your favorite restaurants and create your own food guide")
}
