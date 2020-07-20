//
//  IdusNavigationController.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/20.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

class IdusNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.tintColor = .black
        navigationBar.isTranslucent = false
    
        if #available(iOS 11.0, *) {
            self.navigationBar.prefersLargeTitles = true
        } else {
            
        }
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        GlobalDefine.shared.curNav = self
    }

}
