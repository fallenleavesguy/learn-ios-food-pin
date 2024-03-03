//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by donghs on 2024/3/3.
//

import SwiftUI

struct FormTextView: View {
    let label: String
    
    @Binding var value: String
    
    var height: CGFloat = 200
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label.uppercased())
                .font(.system(.headline, design: .rounded))
                .foregroundStyle(Color(.darkGray))
            
            TextEditor(text: $value)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
                .padding(.top, 10)
        }
    }
}

#Preview("FormTextView", traits: .fixedLayout(width: 300, height: 200)) {
    FormTextView(label: "Description", value: .constant(""))
        .previewLayout(.sizeThatFits)
        .previewDisplayName("FormTextView")
}
