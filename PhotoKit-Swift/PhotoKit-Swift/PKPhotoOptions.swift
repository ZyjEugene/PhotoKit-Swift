//
//  PKPhotoOptions.swift
//  PhotoKit-Swift
//
//  Created by app on 2017/6/14.
//  Copyright © 2017年 Chana. All rights reserved.
//

import UIKit
import Photos
class PKPhotoOptions: PHFetchOptions {

    static let pkOptionsInstance: PKPhotoOptions = PKPhotoOptions()
    private override init() {
        super.init()
        self.predicate = NSPredicate(format: "mediaType == %d", PHAssetMediaType.image.rawValue)
        self.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
    }
}
