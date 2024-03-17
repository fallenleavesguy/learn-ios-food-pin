//
//  WebView.swift
//  FoodPin
//
//  Created by donghs on 2024/3/17.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webview: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webview.load(request)
    }
}

#Preview {
    WebView(url: URL(string: "https://www.baidu.com")!)
}
