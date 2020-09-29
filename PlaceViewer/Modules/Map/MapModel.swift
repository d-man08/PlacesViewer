//
//  MapModel.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 25.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit
import CoreLocation

protocol MapModelDelegate: class {
  
}

protocol MapModelProtocol: class {
  
  var delegate: MapModelDelegate? { get set }
  func getClosestPlace(for location: CLLocation, completion: @escaping (Result<PlaceInfo, Error>) -> Void)
}

class MapModel: MapModelProtocol {
  
  weak var delegate: MapModelDelegate?
  
  let mapService: MapApiServiceProtocol = HereMapsApiService()
  
  func getClosestPlace(for location: CLLocation, completion: @escaping (Result<PlaceInfo, Error>) -> Void) {
    mapService.getClosestPlace(forLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude) { (result) in
      switch result {
      case .success(let placeInfo):
        completion(Result.success(placeInfo))
      case.failure(let error):
        completion(Result.failure(error))
      }
    }
  }
  
}

