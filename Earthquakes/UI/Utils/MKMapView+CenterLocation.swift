import MapKit

extension MKMapView {
  func centerToLocation(
    _ lat: Double,
    _ lng: Double,
    regionRadius: CLLocationDistance = 1000000
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
