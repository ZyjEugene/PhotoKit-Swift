//
//  PKPhotoSelectViewController.swift
//  PhotoKit-Swift
//
//  Created by app on 2017/6/8.
//  Copyright © 2017年 Chana. All rights reserved.
//

import UIKit
import Photos
class PKPhotoSelectViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate {

    var collectionView: UICollectionView!
    var assetCollection = PHAssetCollection()
    var assetListArray = [PHAsset]()
    var lastAccessed = IndexPath()
    var photoSelectArrays = [AblumSelectPhotoModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photo Select"
        self.view.backgroundColor =  UIColor.init(colorLiteralRed: 0.96, green: 0.91, blue: 0.93, alpha: 1.00)

        let panGes = UIPanGestureRecognizer.init(target: self, action: #selector(panGestureAction))
        panGes.delegate = self
        self.view.addGestureRecognizer(panGes)
        
        initCollectionView();
        
        assetListArray = PKPhotoTools().getAssetsInAssetCollection(asset: assetCollection, bool: true)
     }
    
  
    func initCollectionView () {
        let layout = UICollectionViewFlowLayout();
        layout.itemSize = CGSize(width: (SCREEN_WIDTH - 20)/3, height: (SCREEN_WIDTH - 20)/3);
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), collectionViewLayout:layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(nibName: "PhotoSelectCell", bundle: nil), forCellWithReuseIdentifier: "PhotoSelectCell")
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return assetListArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotoSelectCell = collectionView.dequeueReusableCell(withReuseIdentifier:"PhotoSelectCell", for: indexPath) as! PhotoSelectCell

        cell.selectBtn.isSelected = false
        let assets = assetListArray[indexPath.row]
        PKPhotoTools().getPhotoByMaxSize(asset: assets, size: 300) { (image, info) -> Void in
            cell.photoImage?.image = image
            for model in self.photoSelectArrays {
                if model.identifier as String == assets.localIdentifier {
                cell.selectBtn.isSelected = true
                }
            }
        }
        cell.selectBtn.addTarget(self, action: #selector(selectAction), for: UIControlEvents.touchUpInside)
        cell.selectBtn.tag = indexPath.row
        return cell
    }
    
    
    func selectAction(btn: UIButton) {
        let asset = assetListArray[btn.tag]

        if !btn.isSelected {
            let model = AblumSelectPhotoModel(asset: asset, identifier: asset.localIdentifier as NSString, count: 1, isEdit: false)
            photoSelectArrays.append(model)
        }else{
        
//            for model in photoSelectArrays {
//                 if model.identifier as String == asset.localIdentifier {
//                 self.photoSelectArrays.remove(at: index(ofAccessibilityElement: model))
//                }
//            }
        }
       
       btn.isSelected = !(btn.isSelected)
     }
    
    func panGestureAction(pan: UIPanGestureRecognizer) {
       
        let point = pan.location(in: collectionView)
        
        for cell in collectionView!.visibleCells as! [PhotoSelectCell]{
            if cell.frame.contains(point) {//CGRectContainsPoint(cell.frame, point!)
            
                let  indexPath = collectionView.indexPath(for: cell)
                if lastAccessed as IndexPath != indexPath {
                   self.selectAction(btn: cell.selectBtn)
                }
                lastAccessed = indexPath!
            }
            
        }
        if pan.state == UIGestureRecognizerState.ended {
        
            lastAccessed.removeLast()
        }
        
    }
    
    
 }


