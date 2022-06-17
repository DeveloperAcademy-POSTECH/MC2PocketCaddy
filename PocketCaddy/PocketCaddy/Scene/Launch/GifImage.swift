//
//  GifImage.swift
//  test
//
//  Created by Byeon jinha on 2022/06/10.
//

import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable{
    private let name: String
    init(_ name: String){
        self.name = name
    }
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)

        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        webView.scrollView.isScrollEnabled = false // 스크롤 막음. 기능
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context:Context){
//        uiView.reload()
    }
}

