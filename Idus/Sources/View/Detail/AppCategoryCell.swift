//
//  AppCategoryCell.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/21.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

class AppCategoryCell: UITableViewCell {
    
    // MARK: - UI Components
    private var titleLabel: UILabel!
    private var categoriesStackView: UIStackView!
    
    // MARK: - Properties
    
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "AppCategoryCell")
        self.setupView()
        self.setProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.categoriesStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    // MARK: - Private Methods
    
    private func setupView() {
        self.titleLabel = UILabel().then {
            $0.text = "카테고리"
            $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview().offset(20)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
            }
        }
        
        self.categoriesStackView = UIStackView().then {
            $0.axis  = .horizontal
            $0.spacing = 5
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(20)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.lessThanOrEqualToSuperview().offset(-20)
                $0.bottom.equalToSuperview().offset(-20)
            }
        }
    }
    
    private func setProperties() {
        self.backgroundColor = .white
        self.selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    public func drawCell(_ model: AppModel) {
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
}
