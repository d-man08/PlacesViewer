//
//  HereMapsApiService.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 29.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit
import NMAKit

class HereMapsApiService: MapApiServiceProtocol {
  
  func getClosestPlace(forLatitude latitude: Double, longitude: Double, completion: @escaping (Result<PlaceInfo, Error>) -> Void) {
    
    guard let placesInstance = NMAPlaces.sharedInstance() else {
      DispatchQueue.main.async {
        completion(Result.failure(self.defautTypeError()))
      }
      return
    }
    
    let requestCompletion: NMARequestCompletionBlock = { request, discoveryPage, requestError in
      if let error = requestError {
        completion(Result.failure(error))
        return
      }
      guard let discoveryPage = discoveryPage as? NMADiscoveryPage else {
        completion(Result.failure(self.defautTypeError()))
        return
      }
      
      let linksArray: [NMALink] = discoveryPage.discoveryResults
      
      guard let closestPlaceLink = linksArray.first as? NMAPlaceLink else {
        completion(Result.failure(self.defautTypeError()))
        return
      }
      
      self.getDetails(for: closestPlaceLink) { (result) in
        switch result {
        case .success(let placeInfo):
          completion(Result.success(placeInfo))
        case.failure(let error):
          completion(Result.failure(error))
        }
      }
    }
    
    let discoveryRequest = placesInstance.createAroundRequest(location: NMAGeoCoordinates(latitude: latitude, longitude: longitude), searchArea: nil, filters: nil)
    if let error = discoveryRequest.start(requestCompletion) {
      completion(Result.failure(error))
      return
    }
  }
  
  private func getDetails(for placeLink: NMAPlaceLink, completion: @escaping (Result<PlaceInfo, Error>) -> Void) {
    
    placeLink.detailsRequest().start ( { detailsRequest, detailsData, detailsError in
      
        guard detailsError == nil,
          detailsRequest is NMAPlaceRequest,
          let placeObject = detailsData as? NMAPlace,
          let placeInfo = PlaceInfo(hereMapsPlace: placeObject) else {
            completion(Result.failure(self.defautTypeError()))
            return
        }
      completion(Result.success(placeInfo))
    })
  }
 
}

extension HereMapsApiService {
  
  func defautTypeError() -> NSError {
    let errorDetails = [NSLocalizedDescriptionKey: NSLocalizedString("Some types error occured", comment: "Map API service - Error text")]
    return NSError(domain:"", code:500, userInfo:errorDetails)
  }
  
}
