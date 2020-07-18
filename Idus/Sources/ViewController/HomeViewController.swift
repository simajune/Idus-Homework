//
//  HomeViewController.swift
//  Idus
//
//  Created by SIMA on 2020/07/18.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit
import Moya


class HomeViewController: UIViewController {

    // MARK: - Properties
    
    let viewModel = HomeViewModel()
    
    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("로드 성공")
        view.backgroundColor = .red
    }


}

