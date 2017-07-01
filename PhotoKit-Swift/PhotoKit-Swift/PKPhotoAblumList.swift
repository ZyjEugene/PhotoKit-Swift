//
//  PKPhotoAblumList.swift
//  PhotoKit-Swift
//
//  Created by app on 2017/6/8.
//  Copyright © 2017年 Chana. All rights reserved.
//

import UIKit
import Photos


struct PKPhotoAblumList {

    var title: String?
    var count: Int?
    var firstImageAsset: PHAsset
    var assetCollection: PHAssetCollection
    
    init(asset: PHAsset, title: String?, count: Int, assetCollection: PHAssetCollection) {
        self.title = title
        self.count = count
        self.firstImageAsset = asset
        self.assetCollection = assetCollection
    }
    
}
