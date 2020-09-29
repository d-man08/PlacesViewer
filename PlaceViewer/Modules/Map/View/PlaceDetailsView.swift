//
//  PlaceDetailsView.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 29.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit

protocol PlaceDetailsViewProtocol: UIView {
  
  func setup(for placeInfo: PlaceInfo)
}

class PlaceDetailsView: UIView, PlaceDetailsViewProtocol {
  
  @IBOutlet weak var placeNameLabel: UILabel!
  @IBOutlet weak var placeAddressLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    setupUI()
  }
  
  private func setupUI() {
    ThemeHelper.applyTitleTheme(label: placeNameLabel)
    ThemeHelper.applySubtitleTheme(label: placeAddressLabel)
  }
  
  func setup(for placeInfo: PlaceInfo) {
    placeNameLabel.text = placeInfo.name
    placeAddressLabel.text = placeInfo.address
  }
  
}

