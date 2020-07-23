//
//  DetailViewController.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/20.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {
    
    // MARK: - UI Components
    
    private var tableView: UITableView!
    
    // MARK: - Properties
    
    private let viewModel: DetailViewModel
    
    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setProperties()
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
        self.tableView = UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.separatorStyle = .none
            $0.backgroundColor = .clear
            $0.estimatedRowHeight = 100
            
            $0.register(AppScreenShotsCell.self, forCellReuseIdentifier: "AppScreenShotsCell")
            $0.register(AppTitleCell.self, forCellReuseIdentifier: "AppTitleCell")
            $0.register(AppWebShareCell.self, forCellReuseIdentifier: "AppWebShareCell")
            $0.register(AppSizeCell.self, forCellReuseIdentifier: "AppSizeCell")
            $0.register(AppContentRatingCell.self, forCellReuseIdentifier: "AppContentRatingCell")
            $0.register(AppFeatureCell.self, forCellReuseIdentifier: "AppFeatureCell")
            $0.register(AppDescriptionCell.self.self, forCellReuseIdentifier: "AppDescriptionCell")
            
            $0.register(AppCategoryCell.self, forCellReuseIdentifier: "AppCategoryCell")
            self.view.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.bottom.leading.trailing.equalToSuperview()
            }
        }
    }
    
    private func setProperties() {
        self.view.backgroundColor = .white
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppScreenShotsCell") as? AppScreenShotsCell else { return UITableViewCell() }
            cell.drawCell(viewModel.appModel)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppCategoryCell") as? AppCategoryCell else { return UITableViewCell() }
            cell.drawCell(viewModel.appModel)
            return cell
        }
    }
}
