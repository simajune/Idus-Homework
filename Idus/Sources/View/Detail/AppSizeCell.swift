//
//  AppSizeCell.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/23.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

class AppSizeCell: UITableViewCell {
    
    // MARK: - UI Components
    
    // 파일 크기 뷰
    private var fileSizeView: UIView!
    private var fileSizeTitleLabel: UILabel!
    private var fileSizeContentLabel: UILabel!
    private var fileSizeSeparateView: UIView!
    
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
    }
    // MARK: - Private Methods
    
    private func setupView() {
        // 파일 크기 뷰
        self.fileSizeView = UIView().then {
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.bottom.equalToSuperview()
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
    }
    
    private func setProperties() {
        self.backgroundColor = .white
        self.selectionStyle = .none
    }
    
    private func convertToBtyesToMegaBytes(byte: String) -> String {
       guard let intBytes = Int(byte) else { return "0" }
       let intMegaBytes = intBytes / 1048576
       return "\(intMegaBytes)MB"
    }
    
    // MARK: - Public Methods
    
    public func drawCell(_ model: AppModel) {
        fileSizeContentLabel.text = convertToBtyesToMegaBytes(byte: model.fileSizeBytes)
    }
}
