//
//  DetailAppViewController.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/23.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit
import SafariServices

class DetailAppViewController: UIViewController {
    
    // MARK: - UI Components
    
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    
    // 내용 뷰
    private var infoView: UIView!
    
    // 스크린 샷
    private var screenshotScrollView: UIScrollView!
    private var screenshotsStackView: UIStackView!
    private var screenShopImageView: UIImageView!
    
    // 앱 이름, 개발, 가격
    private var appTitleLabel: UILabel!
    private var appSubtitleLabel: UILabel!
    private var priceLabel: UILabel!
    
    // 웹에서 보기, 공유하기 버튼
    private var buttonsView: UIView!
    private var webButton: UIButton!
    private var shareButton: UIButton!
    
    // 구분 뷰
    private var buttonSeparateView: UIView!
    
    // 파일 크기 뷰
    private var fileSizeView: UIView!
    private var fileSizeTitleLabel: UILabel!
    private var fileSizeContentLabel: UILabel!
    private var fileSizeSeparateView: UIView!

    // 연령 뷰
    private var contentRatingView: UIView!
    private var contentRatingTitleLabel: UILabel!
    private var contentRatingContentLabel: UILabel!
    private var contentRatingSeparateView: UIView!
    
    // 새로운 기능 뷰
    private var featureView: UIView!
    private var featureTitleLabel: UILabel!
    private var featureContentLabel: UILabel!
    private var releaseNotesStackView: UIStackView!
    private var releaseNotesLabel: PaddingLabel!
    private var arrowImageView: UIImageView!
    private var featureSeparateView: UIView!
    private var expandedReleaseNotesButton: UIButton!
    
    // 설명
    private var descriptionLabel: UILabel!

    // 섹션 구분 뷰
    private var sectionSeparateView: UIView!
    
    // 카테고리
    private var categoryView: UIView!
    private var categoryTitleLabel: UILabel!
    private var categoriesStackView: UIStackView!
    
    
    // MARK: - Properties
    
    private let viewModel: DetailViewModel
    
    let SCROLLVIEW_INSET: CGFloat = 20.0
    let SCROLLVIEW_SPACE: CGFloat = 8.0
    var trackViewUrlStr: String?
    
    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setProperties()
        self.drawView(model: viewModel.appModel)
    }
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods

    
    // MARK: - Private Methods
    
    private func setupView() {
        self.scrollView = UIScrollView().then {
            self.view.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.leading.trailing.bottom.equalToSuperview()
            }
        }
        self.contentView = UIView().then {
            self.scrollView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.leading.trailing.bottom.equalToSuperview()
                $0.width.equalTo(self.view)
                $0.height.greaterThanOrEqualTo(0)
            }
        }
        
        // 앱 정보 뷰 여기에 쌓아보자!!
        self.infoView = UIView().then {
            self.contentView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.leading.trailing.equalToSuperview()
                $0.width.equalToSuperview()
            }
        }
        self.screenshotScrollView = UIScrollView().then {
            $0.delegate = self
            $0.decelerationRate = .fast
            $0.bounces = true
            $0.clipsToBounds = false
            $0.showsHorizontalScrollIndicator = false
            $0.contentInset = UIEdgeInsets(top: 0, left: SCROLLVIEW_INSET, bottom: 0, right: SCROLLVIEW_INSET)
            self.infoView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview().offset(8)
                $0.leading.trailing.equalToSuperview()
                $0.height.greaterThanOrEqualTo(0)
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
            self.infoView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(screenshotScrollView.snp.bottom).offset(8)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.lessThanOrEqualToSuperview().offset(-20)
                $0.height.equalTo(20)
            }
        }
        self.appSubtitleLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            self.infoView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(appTitleLabel.snp.bottom).offset(4)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.lessThanOrEqualToSuperview().offset(-20)
                $0.height.equalTo(18)
            }
        }
        self.priceLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            self.infoView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(appSubtitleLabel.snp.bottom).offset(8)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.lessThanOrEqualToSuperview().offset(-20)
                $0.height.equalTo(20)
            }
        }
        
        // 웹에서 보기, 공유하기 버튼
        self.buttonsView = UIView().then {
            $0.backgroundColor = .lightGray
            $0.layer.borderColor = UIColor.lightGray.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 8
            self.infoView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(priceLabel.snp.bottom).offset(10)
                $0.leading.equalToSuperview().offset(22)
                $0.trailing.equalToSuperview().offset(-22)
                $0.height.equalTo(48)
            }
        }
        self.webButton = UIButton().then {
            $0.setTitle("웹에서 보기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            $0.backgroundColor = .white
            $0.addTarget(self, action: #selector(webBtnClicked), for: .touchUpInside)
            buttonsView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.leading.bottom.equalToSuperview()
            }
        }
        self.shareButton = UIButton().then {
            $0.setTitle("공유하기", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            $0.backgroundColor = .white
            $0.addTarget(self, action: #selector(shareBtnClicked), for: .touchUpInside)
            buttonsView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.trailing.bottom.equalToSuperview()
                $0.leading.equalTo(webButton.snp.trailing).offset(1)
                $0.width.equalTo(webButton.snp.width)
            }
        }
        self.buttonSeparateView = UIView().then {
            $0.backgroundColor = .lightGray
            self.infoView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(buttonsView.snp.bottom).offset(8)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.height.equalTo(1)
            }
        }
        
        // 파일 크기 뷰
        self.fileSizeView = UIView().then {
            self.infoView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(buttonSeparateView.snp.bottom)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.height.equalTo(48)
            }
        }
        self.fileSizeTitleLabel = UILabel().then {
            $0.textColor = .black
            $0.text = "크기"
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            fileSizeView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.leading.equalToSuperview()
            }
        }
        self.fileSizeContentLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            $0.textColor = .systemTeal
            fileSizeView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.trailing.equalToSuperview().offset(-25)
                $0.leading.greaterThanOrEqualTo(fileSizeTitleLabel.snp.trailing).offset(8)
            }
        }
        self.fileSizeSeparateView = UIView().then {
            $0.backgroundColor = .lightGray
            fileSizeView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(fileSizeTitleLabel.snp.bottom)
                $0.top.equalTo(fileSizeContentLabel.snp.bottom)
                $0.bottom.equalToSuperview()
                $0.leading.equalToSuperview()
                $0.trailing.equalToSuperview()
                $0.height.equalTo(1)
            }
        }

        // 연령 뷰
        self.contentRatingView = UIView().then {
            self.infoView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(fileSizeView.snp.bottom)
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
                $0.leading.greaterThanOrEqualTo(fileSizeTitleLabel.snp.trailing).offset(8)
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
        
        // 새로운 기능 뷰
        self.featureView = UIView().then {
            self.infoView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(contentRatingView.snp.bottom)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
            }
        }
        self.featureTitleLabel = UILabel().then {
            $0.textColor = .black
            $0.text = "새로운 기능"
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            featureView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.leading.equalToSuperview()
                $0.height.equalTo(48)
            }
        }
        self.featureContentLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            $0.textColor = .systemTeal
            featureView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.trailing.equalToSuperview().offset(-25)
                $0.leading.greaterThanOrEqualTo(fileSizeTitleLabel.snp.trailing).offset(8)
                $0.height.equalTo(48)
            }
        }
        self.releaseNotesStackView = UIStackView().then {
            $0.axis = .vertical
            featureView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview().offset(48)
                $0.leading.trailing.equalToSuperview()
                $0.height.greaterThanOrEqualTo(0)
            }
        }
        self.releaseNotesLabel = PaddingLabel(withInsets: 8, 8, 8, 8).then {
            $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            $0.isHidden = true
            $0.clipsToBounds = true
            $0.textColor = UIColor(red: 17.0/255.0, green: 17.0/255.0, blue: 17.0/255.0, alpha: 1.0)
            $0.numberOfLines = 0
            $0.backgroundColor = UIColor(red: 244.0/255.0, green: 244.0/255.0, blue: 244.0/255.0, alpha: 1.0)
            releaseNotesStackView.addArrangedSubview($0)
        }
        self.featureSeparateView = UIView().then {
            $0.backgroundColor = .lightGray
            featureView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(releaseNotesStackView.snp.bottom)
                $0.bottom.equalToSuperview()
                $0.leading.equalToSuperview()
                $0.trailing.equalToSuperview()
                $0.height.equalTo(1)
            }
        }
        self.arrowImageView = UIImageView().then {
            $0.image = UIImage(named: "icArrowDownBlack")
            featureView.addSubview($0)
            $0.snp.makeConstraints {
                $0.centerY.equalTo(featureContentLabel)
                $0.trailing.equalToSuperview()
            }
        }
        self.expandedReleaseNotesButton = UIButton().then {
            $0.setTitle(nil, for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.setTitleColor(.black, for: .selected)
            $0.addTarget(self, action: #selector(featureViewClicked), for: .touchUpInside)
            featureView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.leading.trailing.bottom.equalToSuperview()
            }
        }
        
        // 설명
        self.descriptionLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            $0.textColor = .black
            $0.numberOfLines = 0
            $0.textAlignment = .center
            infoView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(featureView.snp.bottom).offset(10)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.bottom.equalToSuperview().offset(-20)
                $0.height.greaterThanOrEqualTo(0)
            }
        }
        
        // 섹션 구분 뷰
        self.sectionSeparateView = UIView().then {
            $0.backgroundColor = .lightGray
            self.contentView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(self.infoView.snp.bottom)
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(32)
            }
        }
        
        // 카테고리
        self.categoryView = UIView().then {
            $0.backgroundColor = .white
            self.contentView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(sectionSeparateView.snp.bottom)
                $0.leading.trailing.equalToSuperview()
                $0.height.greaterThanOrEqualTo(0)
                $0.bottom.equalToSuperview()
            }
        }
        self.categoryTitleLabel = UILabel().then {
            $0.text = "카테고리"
            $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            self.categoryView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview().offset(20)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
            }
        }
        
        self.categoriesStackView = UIStackView().then {
            $0.axis  = .horizontal
            $0.spacing = 5
            self.categoryView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(categoryTitleLabel.snp.bottom).offset(20)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.lessThanOrEqualToSuperview().offset(-20)
                $0.bottom.equalToSuperview().offset(-20)
            }
        }
    }
    
    private func setProperties() {
        self.view.backgroundColor = .white
    }
    
    private func drawView(model: AppModel) {
        self.trackViewUrlStr = model.trackViewUrl
        
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
                            $0.width.equalTo(self.view.snp.width).multipliedBy(0.6)
                            $0.height.equalTo(imageView.snp.width).multipliedBy(ratio)
                        }
                    case let .failure(error):
                        Log.i(error)
                    }
                }
                screenshotsStackView.addArrangedSubview(imageView)
            }
        }
        appTitleLabel.text = model.trackName
        appSubtitleLabel.text = model.sellerName
        priceLabel.text = model.formattedPrice

        fileSizeContentLabel.text = convertToBtyesToMegaBytes(byte: model.fileSizeBytes)
        contentRatingContentLabel.text = model.trackContentRating
        featureContentLabel.text = model.version
        releaseNotesLabel.text = model.releaseNotes
        releaseNotesLabel.sizeToFit()
        descriptionLabel.text = model.description
        
        self.categoriesStackView.subviews.forEach { $0.removeFromSuperview() }
        model.genres.forEach {
            let label = UILabel()
            label.text = " #\($0) "
            label.layer.cornerRadius = 4
            label.layer.borderColor = UIColor.lightGray.cgColor
            label.layer.borderWidth = 1
            label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            label.snp.makeConstraints {
                $0.height.equalTo(20)
            }
            self.categoriesStackView.addArrangedSubview(label)
        }
    }
    
    private func convertToBtyesToMegaBytes(byte: String) -> String {
        guard let intBytes = Int(byte) else { return "0" }
        let intMegaBytes = intBytes / 1048576
        return "\(intMegaBytes)MB"
    }
    
    @objc private func webBtnClicked() {
        guard let url = URL(string: viewModel.appModel.trackViewUrl) else { return }
        let controller = SFSafariViewController(url: url)
        self.present(controller, animated: true, completion: nil)
    }
    
    @objc private func shareBtnClicked() {
        let items = [URL(string: viewModel.appModel.trackViewUrl)!]
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityVC, animated: true)
    }
    
    @objc private func featureViewClicked() {
        if self.expandedReleaseNotesButton.isSelected {
            self.arrowImageView.image = UIImage(named: "icArrowDownBlack")
            self.expandedReleaseNotesButton.isSelected = false
            self.releaseNotesLabel.isHidden = true
        } else {
            self.arrowImageView.image = UIImage(named: "icArrowUpBlack")
            self.expandedReleaseNotesButton.isSelected = true
            self.releaseNotesLabel.isHidden = false
        }
    }
}

extension DetailAppViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if targetContentOffset.pointee.x < screenshotScrollView.contentSize.width - screenshotScrollView.frame.size.width + SCROLLVIEW_INSET {
            let pageWidth = ((self.view.frame.size.width * 0.6) + SCROLLVIEW_SPACE)
            targetContentOffset.pointee = CGPoint(
                x: round(targetContentOffset.pointee.x / pageWidth) * pageWidth - SCROLLVIEW_INSET,
                y: targetContentOffset.pointee.y
            )
        }
    }
}
