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
  func showDetails(for placeInfo: PlaceInfo)
}

class MapView: UIView {
  
  weak var delegate: MapViewDelegate?
  @IBOutlet weak var mapView: NMAMapView!
  @IBOutlet weak var placeDetailsBackView: UIView!
  
  private var placeDetailsView: PlaceDetailsViewProtocol?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupMapView()
    setupPlaceDetailsView()
  }
  
  private func setupMapView() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
    mapView.addGestureRecognizer(tap)
  }
  
  private func setupPlaceDetailsView() {
    placeDetailsView = PlaceDetailsView.create()
    
    guard let placeDetailsView = placeDetailsView else {
      return
    }
    placeDetailsBackView.addSubview(placeDetailsView)
    placeDetailsView.frame = placeDetailsBackView.bounds
    
    placeDetailsBackView.isHidden = true
    ThemeHelper.applyRounded(placeDetailsBackView)
  }
  
  @objc func handleTap(_ touch: UITapGestureRecognizer) {
    let touchPoint = touch.location(in: self)
    
    guard let touchGeoCoordinates = mapView.geoCoordinates(from: touchPoint) else {
      return
    }
    
    delegate?.viewDidTap(on: CLLocation(latitude: touchGeoCoordinates.latitude, longitude: touchGeoCoordinates.longitude))
  }
  
}

extension MapView: MapViewProtocol {
  
  func showDetails(for placeInfo: PlaceInfo) {
    guard let mapPlaceIcon = mapMarkerIcon() else {
      return
    }
    
    let locationMarker = NMAMapMarker(geoCoordinates: NMAGeoCoordinates(latitude: placeInfo.position.coordinate.latitude, longitude: placeInfo.position.coordinate.longitude), icon: mapPlaceIcon)
    
    self.mapView.removeAllMapObjects()
    self.mapView.add(mapObject: locationMarker)
    
    self.setupPlaceDetailsView(for: placeInfo)
  }
  
  private func mapMarkerIcon() -> NMAImage? {
    guard let mapPlaceImage = ImageHelper.mapMarkerImage,
      let mapPlaceIcon = NMAImage(uiImage: mapPlaceImage) else {
        return nil
    }
    
    return mapPlaceIcon
  }
  
  private func setupPlaceDetailsView(for placeInfo: PlaceInfo) {
    placeDetailsBackView.isHidden = false
    
    placeDetailsView?.setup(for: placeInfo)
  }
  
}
