//
//  FontHelper.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 29.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit

class FontHelper {
  
  class func regularText(withSize size: CGFloat) -> UIFont {
    return UIFont(name: "SFUIText-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  class func titleText(withSize size: CGFloat) -> UIFont {
    return UIFont(name: "SFUIText-Semibold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
  }
  
}
