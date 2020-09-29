//
//  MapView.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 25.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit

protocol MapViewDelegate: class {

    func viewSomeAction(view: MapViewProtocol)
}

protocol MapViewProtocol: UIView {

    var delegate: MapViewDelegate? { get set }
}

class MapView: UIView, MapViewProtocol {

    weak var delegate: MapViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
