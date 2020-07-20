//
//  HomeViewController.swift
//  Idus
//
//  Created by SIMA on 2020/07/18.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit
import Then
import SnapKit


class HomeViewController: UIViewController {

    // MARK: - Properties
    
    let viewModel = HomeViewModel()
    var tableView: UITableView!
    
    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.properties()
        self.setupView()
        self.getApps()
        
    }
    
    private func properties() {
        self.view.backgroundColor = .lightGray
        self.title = "핸드메이드"
    }
    
    private func getApps() {
        viewModel.getApps { (isFinished) in
            print(isFinished)
            if isFinished {
                self.tableView.reloadData()
            }
        }
    }

    
    private func setupView() {
        self.tableView = UITableView().then {
            $0.delegate = self
            $0.dataSource = self
            $0.separatorStyle = .none
            $0.backgroundColor = .clear
            $0.estimatedRowHeight = 100
            $0.register(AppInfoCell.self, forCellReuseIdentifier: "AppInfoCell")
            self.view.addSubview($0)
            $0.snp.makeConstraints {
                $0.top.bottom.leading.trailing.equalToSuperview()
            }
        }
    }

}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.appModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppInfoCell") as? AppInfoCell else { return UITableViewCell()}
        cell.drawCell(viewModel.appModels[indexPath.row])
        return cell
    }
}
