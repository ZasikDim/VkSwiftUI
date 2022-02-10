//
//  VKLoginWebView.swift
//  VK-SwiftUI
//
//  Created by Dmitry Zasenko on 24.01.22.
//

import SwiftUI
import WebKit

struct VKLoginWebView: UIViewRepresentable {
    
    @ObservedObject fileprivate var navigationDelegate = WebViewNavigationDelegate()
    
    @Binding var shouldShowMainView: Bool
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = navigationDelegate
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            uiView.load(request)
        }
        verifyLoginData()
    }
    
    private func verifyLoginData() {
        if navigationDelegate.shouldShowMainView {
            shouldShowMainView = true
        }
    }
    
    private func buildAuthRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "8062998"), //идентификатор
                        URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                        URLQueryItem(name: "display", value: "mobile"),
                        URLQueryItem(name: "scope", value: "friends,photos,groups,wall"),
                        URLQueryItem(name: "response_type", value: "token")
                ]
        let request = URLRequest(url: components.url!)
        return request
    }
}

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate, ObservableObject {
    
    @Published var shouldShowMainView: Bool = false
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                
                return dict
            }
        guard let token = params["access_token"],
              let userIdString = params["user_id"],
              let _ = Int(userIdString)
        else {
            decisionHandler(.allow)
            return
        }
        UserDefaults.standard.set(token, forKey: "vkToken")
        NotificationCenter.default.post(name: NSNotification.Name("vkTokenSaved"), object: self)
    
        MySession.shared.userId = userIdString
        MySession.shared.token = token
        shouldShowMainView = true
        decisionHandler(.cancel)
    }
}
