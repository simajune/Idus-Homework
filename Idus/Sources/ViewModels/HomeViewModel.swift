//
//  HomeViewModel.swift
//  Idus
//
//  Created by SIMA on 2020/07/18.
//  Copyright © 2020 TJ. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON

class HomeViewModel {
    
    // MARK: - Properties
    
    let provider = MoyaProvider<IdusService>()
    var appModels = [AppModel]()
    
    // MARK: - Initailize
    
    init() {
        
    }
    
    // MARK: - Public Methods
    
    public func getApps(completion: @escaping (Bool) -> Void) {
        provider.request(.getAppList) { (result) in
            switch result {
            case let .success(moyaResponse):
                let decoder = JSONDecoder()
                do {
                    let models = try decoder.decode(ItunesResultModel.self, from: moyaResponse.data)
                    self.appModels = models.results
                    completion(true)
                } catch {
                }
            case let .failure(error):
                print("get error : \(error)")
                completion(false)
            }
        }
    }
}
