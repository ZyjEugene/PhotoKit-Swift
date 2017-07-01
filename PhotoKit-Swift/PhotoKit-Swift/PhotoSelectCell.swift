//
//  PhotoSelectCell.swift
//  PhotoKit-Swift
//
//  Created by app on 2017/6/20.
//  Copyright © 2017年 Chana. All rights reserved.
//

import UIKit

class PhotoSelectCell: UICollectionViewCell {
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var photoImage: UIImageView!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImage.clipsToBounds = true
        photoImage.contentMode = .scaleAspectFill
    }

}
