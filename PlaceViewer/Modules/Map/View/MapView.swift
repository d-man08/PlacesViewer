//
//  MapView.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 25.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit
import NMAKit

protocol MapViewDelegate: class {
  
  func viewDidTap(on location: CLLocation)
  
}

protocol MapViewProtocol: UIView {
  
  var delegate: MapViewDelegate? { get set }
  
}

class MapView: UIView, MapViewProtocol {
  
  weak var delegate: MapViewDelegate?
  @IBOutlet weak var mapView: NMAMapView!
  
  private var locationMapMarker: NMAMapMarker?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
    mapView.addGestureRecognizer(tap)
  }
  
  @objc func handleTap(_ touch: UITapGestureRecognizer) {
    let touchPoint = touch.location(in: self)
    
    guard let touchGeoCoordinates = mapView.geoCoordinates(from: touchPoint) else {
      return
    }
    
    guard let mapPlaceIcon = mapMarkerIcon() else {
      return
    }
    
    let locationMarker = NMAMapMarker(geoCoordinates: touchGeoCoordinates, icon: mapPlaceIcon)
    self.locationMapMarker = locationMarker
    
    self.mapView.removeAllMapObjects()
    self.mapView.add(mapObject: locationMarker)
    
  }
  
  private func mapMarkerIcon() -> NMAImage? {
    guard let mapPlaceImage = ImageHelper.mapMarkerImage,
      let mapPlaceIcon = NMAImage(uiImage: mapPlaceImage) else {
        return nil
    }
    
    return mapPlaceIcon
  }
  
}
