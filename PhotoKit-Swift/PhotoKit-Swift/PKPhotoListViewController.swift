//
//  PKPhotoListViewController.swift
//  PhotoKit-Swift
//
//  Created by app on 2017/6/8.
//  Copyright © 2017年 Chana. All rights reserved.
//

import UIKit
import Photos
class PKPhotoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    var ablumListArray = [PKPhotoAblumList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.title = "Photo List"
      self.view.backgroundColor = UIColor.init(colorLiteralRed: 0.96, green: 0.91, blue: 0.93, alpha: 1.00)
      ablumListArray = PKPhotoTools().getPhotoAblumList()
      print(ablumListArray[0])
      initTableView()
    }
    
    func initTableView() {
    
        tableView = UITableView.init(frame: CGRect(x: 0,y: 0,width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .plain)
        tableView.dataSource = self;
        tableView.delegate = self
        tableView.tableFooterView = UIView.init();
        tableView.register(AblumCell.classForCoder(), forCellReuseIdentifier: "ablumCell")
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ablumListArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ablumCell"
        let  cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AblumCell
        
        cell.selectionStyle = .none;
        let model = ablumListArray[indexPath.row]
        
        cell.title?.text = model.title
        cell.countLabel?.text = NSString(format:"(%d)",model.count!) as String
        PKPhotoTools().getPhotoByMaxSize(asset: model.firstImageAsset, size: 300) { (image, info) -> Void in
            cell.imaView?.image = image
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let photoAblum = ablumListArray[indexPath.row]
        let photoPickerVC  = PKPhotoSelectViewController()
        photoPickerVC.assetCollection = photoAblum.assetCollection
        self.navigationController?.pushViewController(photoPickerVC, animated: true)
    }
 }
