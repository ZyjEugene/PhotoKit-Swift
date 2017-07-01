//
//  ViewController.swift
//  PhotoKit-Swift
//
//  Created by app on 2017/6/8.
//  Copyright © 2017年 Chana. All rights reserved.
//

import UIKit
import Photos
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "First Page"
         self.view.backgroundColor = UIColor.init(colorLiteralRed: 0.80, green: 0.87, blue: 0.88, alpha: 1.00)
        
        let tapBtn = UIButton(type: .custom)
        tapBtn.frame = CGRect(x:100, y:120,width:160, height:60)
        tapBtn.setTitle("Tap Me User", for: .normal)
        tapBtn.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        tapBtn.backgroundColor = UIColor.init(colorLiteralRed: 0.91, green: 0.40, blue: 0.55, alpha: 1.00)
        tapBtn.setTitleColor(UIColor.white, for: .normal)
        tapBtn.titleLabel?.font = UIFont(name: SanPro_Blod, size: 16)
        self.view.addSubview(tapBtn)
    }
    
    func tapAction() {
        
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
        let photoListVC = PKPhotoListViewController();
        self.navigationController?.pushViewController(photoListVC, animated: true)
        
        case .notDetermined:
         
            PHPhotoLibrary.requestAuthorization({(status) -> Void in
                if status == .authorized{
                    DispatchQueue.main.async {
                        let photoListVC = PKPhotoListViewController()
                        self.navigationController?.pushViewController(photoListVC, animated: true)
                     }
                }
            })
        default:()
            
        DispatchQueue.main.async(execute:{() -> Void in
            
            let alertController = UIAlertController(title: "请求访问照片",message: "点击 “设置”, 允许访问您的照片", preferredStyle: .alert )
            let cancelAction = UIAlertAction(title: "取消",style: .cancel, handler: nil)
            let settingAction = UIAlertAction(title: "设置", style: .default, handler:{(action) ->Void in
                let url = URL(string: UIApplicationOpenSettingsURLString)
                if let url = url , UIApplication.shared.canOpenURL(url){
                
                    if #available(iOS 10, *){
                        UIApplication.shared.open(url, options: [:], completionHandler: {
                        (success) in
                        })
                    }else{
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        } else {
                            // Fallback on earlier versions
                        }
                    }
                }
            })
        
            alertController.addAction(cancelAction)
            alertController.addAction(settingAction)
            self.present(alertController, animated: true, completion: nil)
        
        })
        
        }
        }
}

