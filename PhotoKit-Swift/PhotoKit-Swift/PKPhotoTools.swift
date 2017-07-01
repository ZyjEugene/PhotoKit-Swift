//
//  PKPhotoTools.swift
//  PhotoKit-Swift
//
//  Created by app on 2017/6/8.
//  Copyright © 2017年 Chana. All rights reserved.
//

import UIKit
import Photos
class PKPhotoTools: NSObject {

    var customSmartCollections = [
    PHAssetCollectionSubtype.smartAlbumUserLibrary,
    PHAssetCollectionSubtype.smartAlbumRecentlyAdded
    ]
    
    
    var albumsListArr = [PKPhotoAblumList]()

    //获取相册列表
    public  func getPhotoAblumList() -> [PKPhotoAblumList] {
        
        var photoAblumList = [PKPhotoAblumList]()
        
        let smartAblums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
   
        for i in 0 ..< smartAblums.count {
         if customSmartCollections.contains(smartAblums[i].assetCollectionSubtype){
            //self.getAssetCollection(collection: smartAblums[i])
            let asset = PHAsset.fetchAssets(in: smartAblums[i], options: PKPhotoOptions.pkOptionsInstance)
            if asset.count > 0 {
                let model = PKPhotoAblumList(asset: asset.firstObject!, title: smartAblums[i].localizedTitle, count: asset.count , assetCollection:smartAblums[i])
                photoAblumList.append(model)
            }
            }
        }
 
        let topUserLibarayList = PHCollectionList.fetchTopLevelUserCollections(with: nil)
        for i in 0 ..< topUserLibarayList.count {
            if let topUserAlbumItem = topUserLibarayList[i] as? PHAssetCollection{
                let asset = PHAsset.fetchAssets(in: topUserAlbumItem, options: PKPhotoOptions.pkOptionsInstance)
                if asset.count > 0 {
                    let model = PKPhotoAblumList(asset: asset.firstObject!, title: topUserAlbumItem.localizedTitle, count: asset.count, assetCollection:topUserAlbumItem)
                   photoAblumList.append(model)
                }
            }
        }
          return photoAblumList
    }
    
    //获取单个相册里的相册集
    func getAssetsInAssetCollection(asset: PHAssetCollection, bool: Bool) -> [PHAsset] {
        var assetsList = [PHAsset]()
 
        let assetsResult = PHAsset.fetchAssets(in: asset, options: PKPhotoOptions.pkOptionsInstance)
        for i in 0 ..< assetsResult.count {
           
            let assets = assetsResult[i]

            if assets.mediaType == PHAssetMediaType.image {
              assetsList.append(assets)
            }
         }
        return assetsList
    }
    
    
    func getPhotoByMaxSize(asset: PHObject, size: CGFloat, completion: @escaping (UIImage?, [NSObject : AnyObject]?)->Void){
        
        let maxSize = size > 600 ? 600: size
        if let asset = asset as? PHAsset {
            
            let factor = CGFloat(asset.pixelHeight)/CGFloat(asset.pixelWidth)
            let scale = UIScreen.main.scale
            let pixcelWidth = maxSize * scale
            let pixcelHeight = CGFloat(pixcelWidth) * factor
            
            PHCachingImageManager().requestImage(for: asset, targetSize: CGSize(width:pixcelWidth, height: pixcelHeight), contentMode: .aspectFit, options: nil, resultHandler: { (image, info) -> Void in
                
                if let info = info as? [String:AnyObject] {
                    let canceled = info[PHImageCancelledKey] as? Bool
                    let error = info[PHImageErrorKey] as? NSError
                    
                    if canceled == nil && error == nil && image != nil {
                        completion(image,info as [NSObject : AnyObject]?)
                    }
                    
                    // download from iCloud
                    let isCloud = info[PHImageResultIsInCloudKey] as? Bool
                    if isCloud != nil && image == nil {
                        let options = PHImageRequestOptions()
                        options.isNetworkAccessAllowed = true
                        PHCachingImageManager().requestImageData(for: asset, options: options, resultHandler: { (data, dataUTI, oritation, info) -> Void in
                            
                            if let data = data {
                                let resultImage = UIImage(data: data, scale: 0.1)
                                completion(resultImage,info as [NSObject : AnyObject]?)
                            }
                        })
                    }
                }
            })
        }
    }
    
    
    private func getAssetCollection(collection: PHAssetCollection){
  
        let asset = PHAsset.fetchAssets(in: collection, options: PKPhotoOptions.pkOptionsInstance)
        if asset.count > 0 {
            let model = PKPhotoAblumList(asset: asset.firstObject!, title: collection.localizedTitle, count: asset.count, assetCollection:collection)
            self.albumsListArr.append(model)
        }
    }
    
    

}
