//
//  AblumCell.swift
//  PhotoKit-Swift
//
//  Created by app on 2017/6/14.
//  Copyright © 2017年 Chana. All rights reserved.
//

import UIKit

class AblumCell: UITableViewCell {
    
    var title: UILabel?
    var imaView: UIImageView?
    var countLabel: UILabel?    
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }
    
    func initUI(){
    
        self.title = UILabel(frame: CGRect(origin:CGPoint(x: 25, y: 10),size:CGSize(width: 180 , height: 20)))
        self.title?.textColor = UIColor.black
        self.title?.font = UIFont(name: SanPro_Regular, size: 16)
        self.addSubview(self.title!)
        
        self.imaView = UIImageView(frame:CGRect(x: 16, y:40, width:90, height:70))
        self.imaView?.contentMode = .scaleAspectFill
        self.imaView?.clipsToBounds = true
        self.imaView?.backgroundColor = UIColor.init(colorLiteralRed: 0.85, green: 0.45, blue: 0.58, alpha: 1.00)
        self.addSubview(self.imaView!)
        
        self.countLabel = UILabel(frame:CGRect(x:120,y: 60,width:100,height:20))
        self.countLabel?.textColor = UIColor.lightGray
        self.countLabel?.font = UIFont(name: SanPro_Regular, size: 14)
        self.addSubview(self.countLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
