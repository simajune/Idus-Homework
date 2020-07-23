//
//  AppScreenShotsCell.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/23.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

protocol DetailAppCellProtocol {
    func drawCell(_ model: AppModel)
}

class AppScreenShotsCell: UITableViewCell, DetailAppCellProtocol {
    
    // MARK: - UI Components
    
    // 스크린 샷
    private var screenshotScrollView: UIScrollView!
    private var screenshotsStackView: UIStackView!
    private var screenShopImageView: UIImageView!
    
    // MARK: - Properties
    
    let SCROLLVIEW_INSET: CGFloat = 20.0
    let SCROLLVIEW_SPACE: CGFloat = 8.0
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "AppScreenShotsCell")
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
        // 스크린 샷
        self.screenshotScrollView = UIScrollView().then {
            $0.delegate = self
            $0.decelerationRate = .fast
            $0.bounces = true
            $0.clipsToBounds = false
            $0.showsHorizontalScrollIndicator = false
            $0.contentInset = UIEdgeInsets(top: 0, left: SCROLLVIEW_INSET, bottom: 0, right: SCROLLVIEW_INSET)
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview().offset(8)
                $0.bottom.leading.trailing.equalToSuperview()
                $0.height.equalTo(350)
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
    }
    
    private func setProperties() {
        self.backgroundColor = .white
        self.selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    public func drawCell(_ model: AppModel) {
        self.screenshotsStackView.subviews.forEach { $0.removeFromSuperview() }
        model.screenshotUrls.forEach { url in
            screenShopImageView = UIImageView().then { imageView in
                imageView.layer.cornerRadius = 20
                imageView.layer.borderColor = UIColor.lightGray.cgColor
                imageView.layer.borderWidth = 1
                imageView.clipsToBounds = true
                imageView.kf.setImage(with: URL(string: url)!) { (result) in
                    switch result {
                    case let .success(response):
                        Log.i(response.image.size)
                        let ratio = response.image.size.height / response.image.size.width
                        imageView.snp.makeConstraints {
                            $0.width.equalTo(self.snp.width).multipliedBy(0.6)
                            
//                            $0.height.equalTo(imageView.snp.width).multipliedBy(ratio)
                        }
                    case let .failure(error):
                        Log.i(error)
                    }
                }
                screenshotsStackView.addArrangedSubview(imageView)
            }
        }
    }
}

// MARK: - UIScrollViewDelegate

extension AppScreenShotsCell: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if targetContentOffset.pointee.x < screenshotScrollView.contentSize.width - screenshotScrollView.frame.size.width + SCROLLVIEW_INSET {
            let pageWidth = ((self.frame.size.width * 0.6) + SCROLLVIEW_SPACE)
            targetContentOffset.pointee = CGPoint(
                x: round(targetContentOffset.pointee.x / pageWidth) * pageWidth - SCROLLVIEW_INSET,
                y: targetContentOffset.pointee.y
            )
        }
    }
}
