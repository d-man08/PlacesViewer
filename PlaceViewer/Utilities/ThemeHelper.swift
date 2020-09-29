//
//  ThemeHelper.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 29.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit

class ThemeHelper {
  
  class func applyRounded(_ view: UIView) {
    view.clipsToBounds = true
    view.layer.cornerRadius = 8
  }
  
  class func applyTitleTheme(label: UILabel) {
    label.textColor = ColorHelper.textBlack
    label.font = FontHelper.titleText(withSize: 17)
  }
  
  class func applySubtitleTheme(label: UILabel) {
    label.textColor = ColorHelper.textGray
    label.font = FontHelper.regularText(withSize: 17)
  }
  
}
