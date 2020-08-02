//
//  MKMapView+CenterLocation.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 02/08/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import MapKit

extension MKMapView {
  func centerToLocation(
    _ lat: Double,
    _ lng: Double,
    regionRadius: CLLocationDistance = 500000
  ) {
    let location = CLLocation(latitude: lat, longitude: lng)
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
    
    removeAnnotations(annotations)
    let annotation = MKPointAnnotation()
    let centerCoordinate = CLLocationCoordinate2D(latitude: lat, longitude:lng)
    annotation.coordinate = centerCoordinate
    addAnnotation(annotation)
  }
}
