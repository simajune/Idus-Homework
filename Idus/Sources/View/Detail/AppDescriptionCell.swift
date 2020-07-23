//
//  AppDescriptionCell.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/23.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

class AppDescriptionCell: UITableViewCell, DetailAppCellProtocol {
    
    // MARK: - UI Components
    
    // 설명
    private var descriptionLabel: UILabel!
    
    // MARK: - Properties
    
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "AppDescriptionCell")
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
        self.descriptionLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            $0.backgroundColor = .white
            $0.textColor = .black
            $0.numberOfLines = 0
            $0.textAlignment = .center
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(self.snp.top).offset(10)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.bottom.equalToSuperview().offset(-40)
            }
        }
    }
    
    private func setProperties() {
        self.backgroundColor = .lightGray
        self.selectionStyle = .none
    }
    
    // MARK: - Public Methods
    
    public func drawCell(_ model: AppModel) {
        self.descriptionLabel.text = model.description
    }
}
