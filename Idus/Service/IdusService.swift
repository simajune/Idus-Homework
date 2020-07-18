//
//  IdusService.swift
//  Idus
//
//  Created by SIMA on 2020/07/18.
//  Copyright © 2020 TJ. All rights reserved.
//

import Moya

enum IdusService {
    case getAppList
}

extension IdusService: TargetType {
    var baseURL: URL {
        return URL(string: "https://itunes.apple.com/term=핸드메이드&country=kr&media=software")!
    }
    
    var path: String {
        switch self {
        case .getAppList:
            return "search"
        }
    }
    
    var method: Method {
        switch self {
        case .getAppList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        var params: [String: Any] = [:]
        switch self {
        case .getAppList:
            params["term"] = "핸드메이드"
            params["country"] = "kr"
            params["media"] = "software"
        }
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
}
