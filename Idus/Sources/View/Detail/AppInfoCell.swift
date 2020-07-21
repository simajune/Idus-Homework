//
//  AppInfoCell.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/21.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

class AppInfoCell: UITableViewCell {
    
    // MARK: - UI Components
    private var screenshotScrollView: UIScrollView!
    private var screenshotsStackView: UIStackView!
    private var appTitleLabel: UILabel!
    private var appSubtitleLabel: UILabel!
    private var priceLabel: UILabel!
    private var buttonsView: UIView!
    private var webButton: UIButton!
    private var shareButton: UIButton!
    
    
    private var descriptionLabel: UITextView!
    
    
    // MARK: - Properties
    
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "AppInfoCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    
    // MARK: - Public Methods
}
