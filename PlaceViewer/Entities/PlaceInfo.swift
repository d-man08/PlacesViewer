//
//  PlaceInfo.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 29.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit
import NMAKit

struct PlaceInfo {
  let name: String
  let position: CLLocation
  let address: String
  
  init?(hereMapsPlace: NMAPlace) {
    guard let placeName = hereMapsPlace.name,
          let addressLabel = hereMapsPlace.location?.address?.formattedAddress,
          let locationGeocoordinates = hereMapsPlace.location?.position else {
            return nil
    }
    
    name = placeName
    address = addressLabel.replacingOccurrences(of: "<br/>", with: ", ")
    position = CLLocation(latitude: locationGeocoordinates.latitude, longitude: locationGeocoordinates.longitude)
  }
}
