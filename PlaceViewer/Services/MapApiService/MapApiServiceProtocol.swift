//
//  MapApiServiceProtocol.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 29.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit

protocol MapApiServiceProtocol {
  
  func getClosestPlace(forLatitude latitude: Double, longitude: Double, completion: @escaping (Result<PlaceInfo, Error>) -> Void)

}
