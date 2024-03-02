//
//  ReviewView.swift
//  FoodPin
//
//  Created by donghs on 2024/3/2.
//

import SwiftUI

struct ReviewView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                
                VStack {
                    Button(action: {}, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 30.0))
                            .foregroundStyle(.white)
                            .padding()
                    })
                    
                    Spacer()
                }
            }
            
            VStack(alignment: .leading) {
                ForEach(Restaurant.Rating.allCases, id: \.self) { rating in
                    HStack {
                        Image(rating.image)
                        Text(rating.rawValue.capitalized)
                            .font(.system(.title, design: .rounded))
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

#Preview {
    ReviewView()
}
