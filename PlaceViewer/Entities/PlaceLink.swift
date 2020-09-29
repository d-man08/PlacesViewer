//
//  PlaceInfo.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 29.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit
import NMAKit

struct PlaceLink {
  let name: String
  let hereMapsDetailsUrl: String
  let position: CLLocation
  
  init?(hereMapsPlaceLink: NMALink) {
    guard let placeName = hereMapsPlaceLink.name,
          let detailsurl = hereMapsPlaceLink.url else { return nil }
    
    name = placeName
    hereMapsDetailsUrl = detailsurl
    
    guard let hereMapsPlace = hereMapsPlaceLink as? NMAPlaceLink,
          let placePosition = hereMapsPlace.position else {
      return nil
    }
    position = CLLocation(latitude: placePosition.latitude, longitude: placePosition.longitude)
  }
}
