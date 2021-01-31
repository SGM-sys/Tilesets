//
//  ViewController.swift
//  Tilesets
//
//  Created by Gor Stepanyan on 30.01.21.
//

import UIKit
import Mapbox

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MGLMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMapView()
    }

    private func configureMapView() {
        
        
        mapView.delegate = self
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

//MARK: - MGLMapViewDelegate
extension ViewController: MGLMapViewDelegate {

    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        let source = MGLRasterTileSource(identifier: "thermal",
                                         tileURLTemplates: ["https://htb84o8eyb.execute-api.us-east-1.amazonaws.com/prod/compute/flight/QPEYD4EUB/{z}/{x}/{y}.png?stretch_range=%5B0.18740656971931458%2C0.24749372452497476%5D&expression=%28v2%20-%20v1%29%2F%28v2%20%2B%20v1%29&v1=red&v2=nir&colormap=custom&custom_colormap=%7B%7D"],
                                         options: [
                                            .tileCoordinateSystem: 0,
                                            .minimumZoomLevel: 2,
                                            .maximumZoomLevel: 21,
                                            .tileSize: 256
                                         ])
        let rasterLayer = MGLRasterStyleLayer(identifier: "thermal", source: source)

        style.addSource(source)
        style.addLayer(rasterLayer)
    }
}

//class ViewController: UIViewController, MGLMapViewDelegate {
//    @IBOutlet weak var mapView: MGLMapView!
//    var rasterLayer: MGLRasterStyleLayer?
//
//    override func viewDidLoad() {
//
//        super.viewDidLoad()
//
////        mapView = MGLMapView(frame: view.bounds)
//        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
////        mapView.setCenter(CLLocationCoordinate2D(latitude: 45.5188, longitude: -122.6748), zoomLevel: 13, animated: false)
//
//        mapView.delegate = self
//
////        view.addSubview(mapView)
//
//        // Add a UISlider that will control the raster layer’s opacity.
//    }
//
//    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
//        // Add a new raster source and layer.
//        let source = MGLRasterTileSource(identifier: "stamen-watercolor", tileURLTemplates: ["https://stamen-tiles.a.ssl.fastly.net/watercolor/{z}/{x}/{y}.jpg"], options: [ .tileSize: 256 ])
//        let rasterLayer = MGLRasterStyleLayer(identifier: "stamen-watercolor", source: source)
//
//        style.addSource(source)
//        style.addLayer(rasterLayer)
//
//        self.rasterLayer = rasterLayer
//    }
//}
