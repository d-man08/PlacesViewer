//
//  ActivityIndicator.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 29.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit
import ProgressHUD

class ActivityIndicator {

  class func show(on viewController: UIViewController) {
    ProgressHUD.show()
  }
  
  class func dismiss(on viewController: UIViewController) {
    ProgressHUD.dismiss()
  }
}
