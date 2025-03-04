//
//  MapViewController.swift
//  PlaceViewer
//
//  Created by Dmitry Soloviov on 25.09.2020.
//  Copyright © 2020 soloviov. All rights reserved.
//

import UIKit

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
    }

}

extension MapViewController: MapViewDelegate {

    func viewSomeAction(view: MapViewProtocol) {
    }
}

extension MapViewController: MapModelDelegate {

}
