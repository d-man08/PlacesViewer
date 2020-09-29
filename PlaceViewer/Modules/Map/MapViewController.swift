//
//  MapViewController.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 25.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit
import CoreLocation

class MapViewController: UIViewController {
  
  var model: MapModelProtocol
  
  fileprivate var tempView: MapViewProtocol?
  var customView: MapViewProtocol! {
    return self.view as? MapViewProtocol
  }
  
  init(withView view: MapViewProtocol, model: MapModelProtocol) {
    self.model = model
    self.tempView = view
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required convenience init?(coder aDecoder: NSCoder) {
    fatalError("This class needs to be initialized with init(withView:model:) method")
  }
  
  override func loadView() {
    super.loadView()
    
    self.view = self.tempView
    self.tempView = nil
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    customView.delegate = self
    model.delegate = self
    
    setupNavigationBar()
  }
  
  private func setupNavigationBar() {
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
}

extension MapViewController: MapViewDelegate {
  
  func viewDidTap(on location: CLLocation) {
    ActivityIndicator.show(on: self)
    model.getClosestPlace(for: location) { (result) in
      switch result {
      case .success(let placeInfo):
        self.customView.showDetails(for: placeInfo)
        ActivityIndicator.dismiss(on: self)
      case.failure(let error):
        ActivityIndicator.dismiss(on: self)
      }
    }
  }
  
}

extension MapViewController: MapModelDelegate {
  
}
