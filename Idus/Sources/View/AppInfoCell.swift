//
//  AppInfoCell.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/20.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit
import Cosmos

class AppInfoCell: UITableViewCell {
    
    // MARK: - UIComponents
    var appMainImageView: UIImageView!
    var appTitleLabel: UILabel!
    var appSubtitle: UILabel!
    var genreLabel: UILabel!
    var priceLabel: UILabel!
    
    var ratingView: CosmosView!
    
    // MARK: - Overriden Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "AppInfoCell")
        self.setupView()
    }
    
    private func setupView() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func drawCell(_ model: AppModel) {
        
    }
}
