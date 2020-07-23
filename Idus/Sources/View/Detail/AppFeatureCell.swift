//
//  AppFeatureCell.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/23.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

class AppFeatureCell: UITableViewCell, DetailAppCellProtocol {
    
    // MARK: - UI Components
    
    // 새로운 기능 뷰
    private var featureView: UIView!
    private var featureTitleLabel: UILabel!
    private var featureContentLabel: UILabel!
    private var releaseNotesStackView: UIStackView!
    private var releaseNotesLabel: UILabel!
    private var arrowImageView: UIImageView!
    private var featureSeparateView: UIView!
    
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
        // 새로운 기능 뷰
        self.featureView = UIView().then {
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.bottom.equalToSuperview()
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
                $0.leading.greaterThanOrEqualTo(featureTitleLabel.snp.trailing).offset(8)
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
        self.releaseNotesLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            $0.isHidden = false
            $0.clipsToBounds = true
            $0.textColor = .black
            $0.numberOfLines = 0
            $0.backgroundColor = .white
            releaseNotesStackView.addArrangedSubview($0)
        }
        self.arrowImageView = UIImageView().then {
            $0.image = UIImage(named: "icArrowDownBlack")
            featureView.addSubview($0)
            $0.snp.makeConstraints {
                $0.centerY.equalTo(featureContentLabel)
                $0.trailing.equalToSuperview()
            }
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
    }
    
    private func setProperties() {
        self.backgroundColor = .white
        self.selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    public func drawCell(_ model: AppModel) {
        featureContentLabel.text = model.version
        releaseNotesLabel.text = model.releaseNotes
        releaseNotesLabel.sizeToFit()
    }
}
