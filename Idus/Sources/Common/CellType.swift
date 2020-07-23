//
//  CellType.swift
//  Idus
//
//  Created by SIMA on 2020/07/24.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit

enum CellType: String, CaseIterable {
    case appScreenshot
    case appTitle
    case appWebShare
    case appSize
    case appContentRating
    case appFeature
    case appDescription
    case appCategory
    
    var identifier: String {
        switch self {
        case .appScreenshot:
            return "AppScreenShotsCell"
        case .appTitle:
            return "AppTitleCell"
        case .appWebShare:
            return "AppWebShareCell"
        case .appSize:
            return "AppSizeCell"
        case .appContentRating:
            return "AppContentRatingCell"
        case .appFeature:
            return "AppFeatureCell"
        case .appDescription:
            return "AppDescriptionCell"
        case .appCategory:
            return "AppCategoryCell"
        }
    }
}
