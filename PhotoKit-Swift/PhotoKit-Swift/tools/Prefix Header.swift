//
//  Prefix Header.swift
//  PhotoKit-Swift
//
//  Created by app on 2017/6/8.
//  Copyright © 2017年 Chana. All rights reserved.
//

import UIKit
import Foundation

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

let SanPro_Regular = "SourceSansPro-Regular"
let SanPro_Blod = "SourceSansPro-Bold"
let SanPro_Semiblod = "SourceSansPro-Semibold"

func RGBCOLOR(r:CGFloat, _ g:CGFloat, _ b:CGFloat) ->UIColor{
return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}

//var gof_RGBAColor: (CGFloat, CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue, alpha in
//    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha);
//}

///// 根据色值生成颜色(无透明度)(格式为0xffffff)
//var get_ColorWithHex: (NSInteger) -> UIColor = { hex in
//    return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hex & 0xFF)) / 255.0, alpha: 1);
//}

var get_SystemFontWithSize: (CGFloat) ->UIFont = { size in
  return UIFont.systemFont(ofSize: size)
}

var get_BlodFontWithSize: (CGFloat) ->UIFont = { size in
    return UIFont.boldSystemFont(ofSize: size)
}

let get_ImageWithName: (String) -> UIImage? = { imageName in
    return UIImage(named: imageName)
}

/// 导航栏高度
let kNavBarHeight = 44.0;
/// 状态栏高度
let kStatusBarHeight = 20.0;
/// Tab栏高度
let kTabBarHeight = 49.0;


/// 获取系统版本号
let kSystemVersion = Float(UIDevice.current.systemVersion);
/// 是否IOS7系统
let kIsIOS7OrLater = Int(UIDevice.current.systemVersion)! >= 7 ? true : false;
/// 是否IOS8系统
let kIsIOS8OrLater = Int(UIDevice.current.systemVersion)! >= 8 ? true : false;
/// 是否IOS9系统
let kIsIOS9OrLater = Int(UIDevice.current.systemVersion)! >= 9 ? true : false;


/**
 打印日志
 
 - parameter message: 日志消息内容
 */
func printLog<T>(message: T)
{
    #if DEBUG
        print(" \(message)");
    #endif
}
 
