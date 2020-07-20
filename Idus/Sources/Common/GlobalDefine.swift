//
//  GlobalDefine.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/20.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

//공통적으로 메모리상에 저장할 내역을 모아두는곳+주석
final class GlobalDefine {

    static let shared = GlobalDefine()
    
    //for common
    public var curNav: UINavigationController? // 현재네비게이션 컨트롤러
}
