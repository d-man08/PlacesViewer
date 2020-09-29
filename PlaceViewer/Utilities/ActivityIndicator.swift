//
//  ActivityIndicator.swift
//  Digital360Health
//
//  Created by Dmitry Soloviov on 3.09.2020.
//  Copyright © 2020 DBBest. All rights reserved.
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
