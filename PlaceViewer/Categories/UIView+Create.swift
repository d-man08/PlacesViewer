//
//  UIView+Create.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 29.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit

extension UIView {
  
  class func create<T>() -> T {
    let viewNibName = String(describing: self)
    let nibContent = Bundle(for: self).loadNibNamed(viewNibName, owner: nil, options: nil)
    guard
      let view = nibContent?.first,
      type(of:view) == self
      else {
        fatalError("Nib \(viewNibName) does not contain \(viewNibName) View as first object")
    }
    return view as! T
  }
  
}
