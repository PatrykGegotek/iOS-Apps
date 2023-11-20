import SwiftUI
import MapKit

struct BuildingDetailView: View {
    
    @ObservedObject var building: Building
    
    var body: some View {
        VStack {
            Image(building.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 330.0, height: 165.0)
            
            HStack {
                Text(building.symbol)
                    .font(.largeTitle)
                    .padding([.leading, .trailing])
                Spacer()
                Button(action: {
//                    building.favourite.toggle()
                    DataManager.shared.toggleFavourite(for: building.id)
                }) {
                    Image(systemName: building.favourite ? "heart.fill" : "heart")
                        .padding(.trailing, 20.0)
                        .font(.title)
                        .foregroundColor(Color.red)
                }
            }
            
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 0.0) {
                    Text(building.name)
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(building.street)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(/*@START_MENU_TOKEN@*/.all, 1.0/*@END_MENU_TOKEN@*/)
                Spacer()
                Image(systemName: (building.wifi ? "wifi" : "wifi.slash"))
                    .font(.title)
                    .foregroundColor(building.wifi ? Color.blue : Color.gray)
                    .padding(1.0)
                Image(systemName: "figure.roll")
                    .font(.title)
                    .foregroundColor(
                        building.wheelchair == .yes ? Color.blue :
                            (building.wheelchair == .limited ? Color.yellow : Color.gray)
                    )
                    .padding(1.0)
                
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            
            
            Text(building.description)
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            
            Map(coordinateRegion: .constant(mapRegion()),
                annotationItems: [building]) { building in
                MapAnnotation(coordinate: building.polygon.coordinate) {
                    PolygonAnnotationView(polygon: building.polygon)
                }
            }
                .frame(height: 250)
        }
        .navigationTitle("Szczegóły Budynku")
    }
    
    private func mapRegion() -> MKCoordinateRegion {
            let polygon = building.polygon
            let region = MKCoordinateRegion(polygon.boundingMapRect)
            return region
        }
}

struct PolygonAnnotationView: View {
    var polygon: MKPolygon

    var body: some View {
        // Tu możesz zdefiniować, jak ma wyglądać widok dla wielokąta, np. znacznik
    }
}

//#Preview {
//    BuildingDetailView(building: Building(
//        name: "Budynek DS-16",
//        subName: "Dom Studencki Itaka",
//        address: "Ul. Tokarskiego 10, 30-065 Kraków",
//        description: "Fusce volutpat leo nunc, id lobortis ligula porta in. Nulla varius lorem ac magna condimentum dapibus. Vestibulum pulvinar justo a ex tincidunt, a pulvinar tortor mollis. Aliquam hendrerit pretium sollicitudin.",
//        imageName: "MainImage",
//        isForDisabled: .limited,
//        isWiFi: true,
//        map: "Map",
//        building: .dormitory,
//        polygon: MKPolygon(coordinates: [
//            CLLocationCoordinate2D(latitude: 19.912784, longitude: 50.0672586),
//            CLLocationCoordinate2D(latitude: 19.9127486, longitude: 50.067163),
//            CLLocationCoordinate2D(latitude: 19.9128873, longitude: 50.0671416),
//            CLLocationCoordinate2D(latitude: 19.9129232, longitude: 50.0672372)
//          ], count: 4),
//        favourite: false
//    ))
//}
