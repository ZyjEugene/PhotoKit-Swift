//
//  AblumSelectPhotoModel.swift
//  PhotoKit-Swift
//
//  Created by app on 2017/6/30.
//  Copyright © 2017年 Chana. All rights reserved.
//

import UIKit
import Photos
struct AblumSelectPhotoModel {
    var asset = PHAsset()
    var identifier = NSString()
    var count = NSInteger()
     var isEdit = Bool()
    
    init(asset: PHAsset, identifier: NSString, count: NSInteger, isEdit: Bool) {
        self.asset = asset
        self.identifier = identifier
        self.count = count
        self.isEdit = isEdit
    }
    

}


    


