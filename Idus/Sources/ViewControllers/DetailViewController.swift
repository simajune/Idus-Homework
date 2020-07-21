//
//  DetailViewController.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/20.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

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
        Log.i("viewDidLoad")
    }
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        Log.i("init")
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
            $0.register(AppCategoryCell.self, forCellReuseIdentifier: "AppCategoryCell")
            self.view.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.bottom.leading.trailing.equalToSuperview()
            }
        }
    }
    
    private func setProperties() {
//        self.view.backgroundColor = .yellow
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.appModel.genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppCategoryCell") as? AppCategoryCell else { return UITableViewCell()}
        cell.drawCell(model: viewModel.appModel)
        return cell
    }
}
