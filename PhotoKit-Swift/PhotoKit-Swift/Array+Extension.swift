//
//  Array+Extension.swift
//  PhotoKit-Swift
//
//  Created by app on 2017/6/30.
//  Copyright © 2017年 Chana. All rights reserved.
//

import UIKit

extension Array where Element: Equatable{


    mutating func remove(_ object: Element){
    
        if let index = index(of: object) {
          remove(at: index)
        }
    
    }
}
