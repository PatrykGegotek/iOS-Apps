import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var polygon: MKPolygon
    var region: MKCoordinateRegion

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.setRegion(region, animated: true)
        mapView.addOverlay(polygon)
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polygon = overlay as? MKPolygon {
                let renderer = MKPolygonRenderer(polygon: polygon)
                renderer.fillColor = UIColor.blue.withAlphaComponent(0.2)
                renderer.strokeColor = UIColor.blue
                renderer.lineWidth = 2
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    }
}


extension MKPolygon {
    static func examplePolygon() -> MKPolygon {
        let coordinates = [
            CLLocationCoordinate2D(latitude: 37.783333, longitude: -122.416667),
            CLLocationCoordinate2D(latitude: 37.784, longitude: -122.417),
            CLLocationCoordinate2D(latitude: 37.784, longitude: -122.416),
            CLLocationCoordinate2D(latitude: 37.783333, longitude: -122.416667)
        ]
        return MKPolygon(coordinates: coordinates, count: coordinates.count)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(polygon: MKPolygon.examplePolygon(), region: MKCoordinateRegion(MKPolygon.examplePolygon().boundingMapRect))
            .frame(height: 300)
    }
}

