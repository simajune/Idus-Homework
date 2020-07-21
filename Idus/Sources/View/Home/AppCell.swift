//
//  AppCell.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/20.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit
import Kingfisher
import Cosmos

class AppCell: UITableViewCell {
    
    // MARK: - UIComponents
    
    var contentsView: UIView!
    var appMainImageView: UIImageView!
    var titleView: UIView!
    var appTitleLabel: UILabel!
    var appSubtitle: UILabel!
    var infoView: UIView!
    var genreLabel: UILabel!
    var priceLabel: UILabel!
    
    var ratingView: CosmosView!
    
    // MARK: - Overriden Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "AppCell")
        self.properties()
        self.setupView()
    
    }
    
    private func setupView() {
        self.contentsView = UIView().then {
            $0.clipsToBounds = true
            $0.backgroundColor = .lightGray
            $0.layer.cornerRadius = 8
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.leading.equalToSuperview().offset(10)
                $0.trailing.equalToSuperview().offset(-10)
                $0.bottom.equalToSuperview()
            }
        }
        self.appMainImageView = UIImageView().then {
            contentsView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.leading.trailing.equalToSuperview()
                $0.height.equalTo(self.contentsView.snp.width)
            }
        }
        self.titleView = UIView().then {
            $0.backgroundColor = .white
            contentsView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(appMainImageView.snp.bottom).offset(1)
                $0.leading.trailing.equalToSuperview()
            }
        }
        self.appTitleLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            titleView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview().offset(10)
                $0.leading.equalToSuperview().offset(10)
                $0.trailing.equalToSuperview().offset(-10)
            }
        }
        self.appSubtitle = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            $0.textColor = .lightGray
            titleView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(appTitleLabel.snp.bottom).offset(2)
                $0.leading.equalToSuperview().offset(10)
                $0.trailing.equalToSuperview().offset(-10)
                $0.bottom.equalToSuperview().offset(-10)
            }
        }
        self.infoView = UIView().then {
            $0.backgroundColor = .white
            contentsView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(titleView.snp.bottom).offset(1)
                $0.leading.trailing.equalToSuperview()
                $0.bottom.equalToSuperview()
            }
        }
        self.genreLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            infoView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview().offset(10)
                $0.leading.equalToSuperview().offset(10)
                $0.trailing.equalToSuperview().offset(-10)
            }
        }
        self.priceLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            $0.textColor = .lightGray
            infoView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(genreLabel.snp.bottom).offset(2)
                $0.leading.equalToSuperview().offset(10)
                $0.trailing.equalToSuperview().offset(-10)
                $0.bottom.equalToSuperview().offset(-10)
            }
        }
        self.ratingView = CosmosView().then {
            $0.settings.starSize = 20
            $0.settings.starMargin = 0
            infoView.addSubview($0)
            $0.snp.makeConstraints {
                $0.centerY.equalTo(genreLabel)
                $0.trailing.equalToSuperview().offset(-10)
            }
        }
    }
    
    private func properties() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func drawCell(_ model: AppModel) {
        self.appMainImageView.kf.setImage(with: URL(string: model.artworkUrl512)!)
        self.appTitleLabel.text = model.trackName
        self.appSubtitle.text = model.sellerName
        self.genreLabel.text = model.genres.first ?? ""
        self.priceLabel.text = model.formattedPrice
        self.ratingView.rating = model.averageUserRating
    }
}
