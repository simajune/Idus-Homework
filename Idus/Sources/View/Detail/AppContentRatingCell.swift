//
//  AppContentRatingCell.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/23.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

class AppContentRatingCell: UITableViewCell, DetailAppCellProtocol{
    
    // MARK: - UI Components
    
    // 연령 뷰
    private var contentRatingView: UIView!
    private var contentRatingTitleLabel: UILabel!
    private var contentRatingContentLabel: UILabel!
    private var contentRatingSeparateView: UIView!
    
    // MARK: - Properties
    
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "AppWebShareCell")
        self.setupView()
        self.setProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    // MARK: - Private Methods
    
    private func setupView() {
        // 연령 뷰
        self.contentRatingView = UIView().then {
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.bottom.equalToSuperview()
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.height.equalTo(48)
            }
        }
        self.contentRatingTitleLabel = UILabel().then {
            $0.textColor = .black
            $0.text = "연령"
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            contentRatingView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.leading.equalToSuperview()
            }
        }
        self.contentRatingContentLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            $0.textColor = .systemTeal
            contentRatingView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.trailing.equalToSuperview().offset(-25)
                $0.leading.greaterThanOrEqualTo(contentRatingTitleLabel.snp.trailing).offset(8)
            }
        }
        self.contentRatingSeparateView = UIView().then {
            $0.backgroundColor = .lightGray
            contentRatingView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(contentRatingTitleLabel.snp.bottom)
                $0.top.equalTo(contentRatingContentLabel.snp.bottom)
                $0.bottom.equalToSuperview()
                $0.leading.equalToSuperview()
                $0.trailing.equalToSuperview()
                $0.height.equalTo(1)
            }
        }
    }
    
    private func setProperties() {
        self.backgroundColor = .white
        self.selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    public func drawCell(_ model: AppModel) {
        contentRatingContentLabel.text = model.trackContentRating
    }
}
