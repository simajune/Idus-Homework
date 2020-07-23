//
//  AppWebShareCell.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/23.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

protocol AppWebShareCellDelegate {
    func webBtnClicked(url: String?)
    func shareBtnClicked(url: String?)
}

class AppWebShareCell: UITableViewCell, DetailAppCellProtocol {
    
    // MARK: - UI Components
    
    // 웹에서 보기, 공유하기 버튼
    private var buttonsView: UIView!
    private var webButton: UIButton!
    private var shareButton: UIButton!
    private var buttonSeparateView: UIView!
    
    // MARK: - Properties
    
    var delegate: AppWebShareCellDelegate?
    var trackViewUrlStr: String?
    
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
        // 웹에서 보기, 공유하기 버튼
        self.buttonsView = UIView().then {
            $0.backgroundColor = .lightGray
            $0.layer.borderColor = UIColor.lightGray.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 8
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalToSuperview().offset(10)
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
            $0.addTarget(self, action: #selector(webBtnAction), for: .touchUpInside)
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
            $0.addTarget(self, action: #selector(shareBtnAction), for: .touchUpInside)
            buttonsView.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.trailing.bottom.equalToSuperview()
                $0.leading.equalTo(webButton.snp.trailing).offset(1)
                $0.width.equalTo(webButton.snp.width)
            }
        }
        self.buttonSeparateView = UIView().then {
            $0.backgroundColor = .lightGray
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.equalTo(buttonsView.snp.bottom).offset(8)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.height.equalTo(1)
                $0.bottom.equalToSuperview()
            }
        }
    }
    
    private func setProperties() {
        self.backgroundColor = .white
        self.selectionStyle = .none
    }
    
    @objc func webBtnAction() {
        delegate?.webBtnClicked(url: self.trackViewUrlStr)
    }
    
    @objc func shareBtnAction() {
        delegate?.shareBtnClicked(url: self.trackViewUrlStr)
    }
    
    // MARK: - Public Methods
    
    public func drawCell(_ model: AppModel) {
        
    }
}
