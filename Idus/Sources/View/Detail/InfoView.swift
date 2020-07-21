//
//  InfoView.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/21.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

class InfoView: UIView {
    
    enum InfoType {
        case defaultType
        case releaseType
    }
    
    // MARK: - UI Components
    
    private var titleLabel: UILabel!
    private var contentsLabel: UILabel!
    private var downArrowButton: UIButton!
    private var releaseNotesLabel: UILabel!
    
    // MARK: - Initialize
    
    init(title: String, contents: String, type: InfoType) {
        super.init(frame: .zero)
        setupView(title: title, contents: contents, type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView(title: String, contents: String, type: InfoType) {
        self.titleLabel = UILabel().then {
            $0.text = title
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().offset(20)
            }
        }
        
    }
    
    private func setProperties() {
        
    }
}
