//
//  HomeCoordinator.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 25.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit

class HomeCoordinator {
  
  private let navigationController: UINavigationController
  
  init(with navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    let mapViewController = buildMapScreen()
    navigationController.setViewControllers([mapViewController], animated: true)
  }
  
  private func buildMapScreen() -> MapViewController{
    let mapViewController = MapBuilder.viewController()
    return mapViewController
  }

}
