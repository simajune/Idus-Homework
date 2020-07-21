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
    
    // 스크린 샷
    private var screenshotScrollView: UIScrollView!
    private var screenshotsStackView: UIStackView!
    
    // 앱 이름, 개발, 가격
    private var appTitleLabel: UILabel!
    private var appSubtitleLabel: UILabel!
    private var priceLabel: UILabel!
    
    // 웹에서 보기, 공유하기 버튼
    private var buttonsView: UIView!
    private var webButton: UIButton!
    private var shareButton: UIButton!
    private var buttonSeparateView: UIView!
    
    // 파일 크기 뷰
//    private var fileSizeView: InfoView!
    private var fileSizeView: UIView!
    private var fileSizeTitleLabel: UILabel!
    private var fileSizeContentLabel: UILabel!
    private var fileSizeSeparateView: UIView!

    // 연령 뷰
//    private var contentRatingView: InfoView!
    private var contentRatingView: UIView!
    private var contentRatingTitleLabel: UILabel!
    private var contentRatingContentLabel: UILabel!
    private var contentRatingSeparateView: UIView!
    
    // 새로운 기능 뷰
//    private var featureView: InfoView!
    private var featureView: UIView!
    private var featureTitleLabel: UILabel!
    private var featureContentLabel: UILabel!
    private var releaseNotesLabel: UILabel!
    private var featureSeparateView: UIView!
    
    // 설명
    private var descriptionLabel: UITextView!
    
    
    // MARK: - Properties
    
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "AppInfoCell")
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
    // 스크린 샷
        self.screenshotScrollView = UIScrollView().then {
            $0.bounces = true
            $0.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview().offset(8)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(self.snp.width)
            }
        }
        self.screenshotsStackView = UIStackView().then {
            $0.axis = .horizontal
            $0.spacing = 8
            screenshotScrollView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.leading.trailing.bottom.equalToSuperview()
                $0.height.equalToSuperview()
                $0.width.greaterThanOrEqualTo(0)
            }
        }
        
        // 앱 이름, 개발, 가격
        self.appTitleLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(screenshotScrollView.snp.bottom).offset(8)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.lessThanOrEqualToSuperview().offset(-20)
            }
        }
        self.appSubtitleLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(appTitleLabel.snp.bottom).offset(4)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.lessThanOrEqualToSuperview().offset(-20)
            }
        }
        self.priceLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(appSubtitleLabel.snp.bottom).offset(8)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.lessThanOrEqualToSuperview().offset(-20)
                $0.bottom.equalToSuperview().offset(-20)
            }
        }
        
        // 웹에서 보기, 공유하기 버튼
//        self.buttonsView
//        self.webButton
//        self.shareButton
//        self.buttonSeparateView
        
        // 파일 크기 뷰
//        self.fileSizeView
//        self.fileSizeTitleLabel
//        self.fileSizeContentLabel
//        self.fileSizeSeparateView

        // 연령 뷰
//        self.contentRatingView
//        self.contentRatingTitleLabel
//        self.contentRatingContentLabel
//        self.contentRatingSeparateView
        
        // 새로운 기능 뷰
//        self.featureView
//        self.featureTitleLabel
//        self.featureContentLabel
//        self.releaseNotesLabel
//        self.featureSeparateView
        
        // 설명
//        self.descriptionLabel
    }
    
    // MARK: - Public Methods
    
    public func drawCell(_ model: AppModel) {
        model.screenshotUrls.forEach { url in
            _ = UIImageView().then {
                $0.layer.cornerRadius = 20
                $0.clipsToBounds = true
                $0.kf.setImage(with: URL(string: url)!)
                screenshotsStackView.addArrangedSubview($0)
                $0.snp.makeConstraints {
                    $0.height.equalToSuperview()
                    $0.width.equalTo(200)
                }
            }
            
        }
        appTitleLabel.text = model.trackName
        appSubtitleLabel.text = model.sellerName
        priceLabel.text = model.formattedPrice
    }
}
