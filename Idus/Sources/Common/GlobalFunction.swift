//
//  GlobalFunction.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/20.
//  Copyright © 2020 TJ. All rights reserved.
//

import Foundation
import UIKit

//공용으로 쓰일만한 기능들을 정의 + 주석 + class func유지
class GlobalFunction {
    //현재네비게이션에서 새로운뷰를 Push
    class func pushVC(_ getVC: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            GlobalDefine.shared.curNav?.pushViewController(getVC, animated: animated)
            completion?()
        }
    }
}
