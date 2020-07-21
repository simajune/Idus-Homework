//
//  AppModel.swift
//  Idus
//
//  Created by Taejune Jung on 2020/07/20.
//  Copyright © 2020 TJ. All rights reserved.
//

import Foundation

class ItunesResultModel: Codable {
    var resultCount: Int
    var results: [AppModel]
}

class AppModel: Codable {
    var isGameCenterEnabled: Bool
    var artistViewUrl: String
    var artworkUrl60: String
    var artworkUrl100: String
    var artworkUrl512: String
    var screenshotUrls: [String]
    var ipadScreenshotUrls: [String]
    var supportedDevices: [String]
    var kind: String
    var features: [String]
    var trackCensoredName: String
    var trackViewUrl: String
    var averageUserRating: Double
    var averageUserRatingForCurrentVersion: Double
    var userRatingCountForCurrentVersion: Int
    var trackId: Int
    var trackName: String
    var fileSizeBytes: String
    var trackContentRating: String
    var sellerName: String
    var releaseDate: String
    var currentVersionReleaseDate: String
    var genreIds: [String]
    var formattedPrice: String
    var primaryGenreName: String
    var isVppDeviceBasedLicensingEnabled: Bool
    var minimumOsVersion: String
    var releaseNotes: String?
    var version: String
    var wrapperType: String
    var artistId: Int
    var artistName: String
    var genres: [String]
    var price: Int
    var description: String
    var bundleId: String
    var userRatingCount: Int
}
