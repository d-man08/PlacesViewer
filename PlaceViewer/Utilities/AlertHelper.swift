//
//  AlertHelper.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 29.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit

/// The type alias for action closure
typealias ActionHandlerType = () -> ()

class AlertHelper {
  
  class func showAlert(withTitle title: String?, message: String?, on controller: UIViewController, closeHandler: ActionHandlerType?) {
    
    DispatchQueue.main.async {
      
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: "Alert view - button"), style: .cancel) { (alertAction) in
        if let closeHandler = closeHandler {
          closeHandler()
        }
      }
      
      alertController.addAction(okAction)
      
      controller.present(alertController, animated: true, completion: nil)
    }
  }
  
}
