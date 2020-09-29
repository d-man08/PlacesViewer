//
//  UIView+Create.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 29.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit

extension UIView {
  
  class func fromNib<T: UIView>() -> T {
    return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
  }
  
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
  
  class func create <ViewType> (withNibName nibName: String) -> ViewType {
      
      let nibContent = Bundle(for: self).loadNibNamed(nibName, owner: nil, options: nil)
      guard let view = nibContent?.first as? ViewType else {
          fatalError("Nib \(nibName) does not contain \(nibName) View as first object")
      }
      return view
  }
  
}
