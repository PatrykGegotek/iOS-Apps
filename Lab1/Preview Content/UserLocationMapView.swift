import SwiftUI
import MapKit

struct UserLocationMapView: View {
    @State private var region = MKCoordinateRegion()

    var body: some View {
        Map(coordinateRegion: $region)
            .mapControls {
                MapUserLocationButton()
            }
            .onAppear {
                CLLocationManager().requestWhenInUseAuthorization()
            }
    }
}
