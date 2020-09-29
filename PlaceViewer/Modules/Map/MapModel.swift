//
//  MapModel.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 25.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit

protocol MapModelDelegate: class {

}

protocol MapModelProtocol: class {

    var delegate: MapModelDelegate? { get set }
}

class MapModel: MapModelProtocol {

    weak var delegate: MapModelDelegate?

}

