//
//  TrackWebViewController.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/21.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit
import WebKit
import SnapKit
import Then

class TrackWebViewController: UIViewController {
    
    // MARK: - UI Components
    
    private var webView: WKWebView!
    
    // MARK: - Properties
    
    private let trackWebUrl: String
    
    // MARK: - Initialize
    
    init(url: String) {
        self.trackWebUrl = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        self.webView = WKWebView().then {
            self.view.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.bottom.leading.trailing.equalToSuperview()
            }
            self.disableBounces($0)
        }
        self.loadWebView(with: self.trackWebUrl)
    }
    
    private func disableBounces(_ getWebview: WKWebView) {
        getWebview.scrollView.bounces = false
        
        for subview in getWebview.subviews {
            if let subview = subview as? UIScrollView {
                subview.bounces = false
            }
        }
    }
    
    private func loadWebView(with url: String) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        
        if self.webView != nil {
            DispatchQueue.main.async {
                self.webView?.load(request)
            }
        }
    }
    
    // MARK: - Public Methods
}

