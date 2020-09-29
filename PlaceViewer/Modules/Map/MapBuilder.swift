//
//  MapBuilder.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 25.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit

class MapBuilder: NSObject {
  
  class func viewController() -> MapViewController {
    
    let view: MapViewProtocol = MapView.create() as MapViewProtocol
    let model: MapModelProtocol = MapModel()
    
    let viewController = MapViewController(withView: view, model: model)
    return viewController
  }
  
}

