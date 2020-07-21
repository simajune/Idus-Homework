//
//  InfoView.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/21.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

protocol InfoViewDelegate {
    func didFinishedArrowBtnAction()
}

class InfoView: UIView {
    
    enum InfoType {
        case defaultType
        case releaseType
    }
    
    // MARK: - UI Components
    
    private var titleLabel: UILabel!
    private var contentsLabel: UILabel!
    private var downArrowButton: UIButton!
    private var releaseNotesLabel: UILabel!
//    private var releaseNotesLabelHeight: NSLayoutConstraint!
    private var bottomView: UIView!
    
    var delegate: InfoViewDelegate?
    
    // MARK: - Initialize
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        self.titleLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().offset(20)
            }
        }
        self.downArrowButton = UIButton().then {
            $0.setImage(UIImage(named: "icArrowDownBlack"), for: .normal)
            $0.setImage(UIImage(named: "icArrowUpBlack"), for: .selected)
            $0.setTitle(nil, for: .normal)
            $0.addTarget(self, action: #selector(arrowBtnAction(sender:)), for: .touchUpInside)
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalTo(contentsLabel.snp.trailing).offset(8)
                $0.trailing.equalToSuperview().offset(-20)
            }
        }
        self.contentsLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            $0.textColor = .cyan
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.centerY.equalTo(downArrowButton)
                $0.leading.greaterThanOrEqualTo(titleLabel.snp.trailing).offset(8)
            }
        }
        self.releaseNotesLabel = UILabel().then {
            $0.isHidden = true
            $0.clipsToBounds = true
            self.addSubview($0)
            $0.backgroundColor = .gray
//            self.releaseNotesLabelHeight = releaseNotesLabel.heightAnchor.constraint(equalToConstant: 0)
            $0.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(10)
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.bottom.equalTo(bottomView.snp.top)
            }
        }
        self.bottomView = UIView().then {
            $0.backgroundColor = .lightGray
            self.addSubview($0)
            $0.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(20)
                $0.trailing.equalToSuperview().offset(-20)
                $0.height.equalTo(1)
                $0.bottom.equalToSuperview()
            }
        }
    }
    
    private func setProperties() {
        
    }
    
    @objc private func arrowBtnAction(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        delegate?.didFinishedArrowBtnAction()
    }
}
