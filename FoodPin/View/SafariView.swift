//
//  SafariView.swift
//  FoodPin
//
//  Created by donghs on 2024/3/17.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}

#Preview {
    SafariView(url: URL(string: "https://www.baidu.com")!)
        .ignoresSafeArea()
}
