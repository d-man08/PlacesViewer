//
//  AppCoordinator.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 25.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit

class AppCoordinator {
  
  private let navigationController: UINavigationController
  private var homeCoordinator: HomeCoordinator?
  
  init(with navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func start() {
    configureNavigationController()
    showHome()
  }
  
  private func configureNavigationController() {
    self.navigationController.navigationBar.shadowImage = UIImage()
    self.navigationController.navigationBar.isTranslucent = true
    self.navigationController.navigationBar.largeTitleTextAttributes = [
      .foregroundColor: UIColor.gray,
      .font: UIFont.systemFont(ofSize: 22)]
  }
  
  private func showHome() {
    homeCoordinator = HomeCoordinator(with: navigationController)
    homeCoordinator?.start()
  }

}
