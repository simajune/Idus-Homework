//
//  HomeViewModel.swift
//  Idus
//
//  Created by SIMA on 2020/07/18.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit
import Moya

class HomeViewModel {
    
    let provider = MoyaProvider<IdusService>()
    
    init() {
    }
    
    public func getApps() {
    }
}
