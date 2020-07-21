//
//  IdusNavigationController.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/20.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

class IdusNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.tintColor = .black
        navigationBar.isTranslucent = false
        navigationBar.topItem?.title = "핸드메이드"
        
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .automatic
            if #available(iOS 13.0, *) {
                navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        GlobalDefine.shared.curNav = self
    }

}
