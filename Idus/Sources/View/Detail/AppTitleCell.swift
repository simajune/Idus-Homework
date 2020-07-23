//
//  AppTitleCell.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/23.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

class AppTitleCell: UITableViewCell {
    
    // MARK: - UI Components
    
    // 앱 이름, 개발, 가격
    private var appTitleLabel: UILabel!
    private var appSubtitleLabel: UILabel!
    private var priceLabel: UILabel!
    
    // MARK: - Properties
    
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "AppTitleCell")
        self.setupView()
        self.setProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    // MARK: - Private Methods
    
    private func setupView() {
        // 앱 이름, 개발, 가격
        self.appTitleLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview().offset(8)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.lessThanOrEqualToSuperview().offset(-20)
                $0.height.equalTo(20)
            }
        }
        self.appSubtitleLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(appTitleLabel.snp.bottom).offset(4)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.lessThanOrEqualToSuperview().offset(-20)
                $0.height.equalTo(18)
            }
        }
        self.priceLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(appSubtitleLabel.snp.bottom).offset(8)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.lessThanOrEqualToSuperview().offset(-20)
                $0.height.equalTo(20)
                $0.bottom.equalToSuperview().offset(-10)
            }
        }
    }
    
    private func setProperties() {
        self.backgroundColor = .white
        self.selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    public func drawCell(_ model: AppModel) {
        appTitleLabel.text = model.trackName
        appSubtitleLabel.text = model.sellerName
        priceLabel.text = model.formattedPrice
    }
}
