
import Foundation
import MapKit

enum DisabledAccessibility: String {
    case yes
    case no
    case limited
}

enum BuildingType {
    case dormitory
    case univerity
    case other
}

struct Building: Identifiable {
    var id = UUID()
    var name: String
    var subName: String
    var address: String
    var description: String
    var imageName: String
    var isForDisabled: DisabledAccessibility
    var isWiFi: Bool
    var map: String
    var building: BuildingType
    var polygon: MKPolygon
    var favourite: Bool
    
    static var sampleBuildings: [Building] = [
        Building(
            name: "DS-16",
            subName: "Dom Studencki Itaka",
            address: "Ul. Tokarskiego 10, 30-065 Kraków",
            description: "Fusce volutpat leo nunc, id lobortis ligula porta in. Nulla varius lorem ac magna condimentum dapibus. Vestibulum pulvinar justo a ex tincidunt, a pulvinar tortor mollis. Aliquam hendrerit pretium sollicitudin.",
            imageName: "MainImage",
            isForDisabled: .limited,
            isWiFi: true,
            map: "Map",
            building: .dormitory,
            polygon: MKPolygon(coordinates: [
                CLLocationCoordinate2D(latitude: 19.912784, longitude: 50.0672586),
                CLLocationCoordinate2D(latitude: 19.9127486, longitude: 50.067163),
                CLLocationCoordinate2D(latitude: 19.9128873, longitude: 50.0671416),
                CLLocationCoordinate2D(latitude: 19.9129232, longitude: 50.0672372)
              ], count: 4),
            favourite: false
        ),
        Building(
            name: "D-17",
            subName: "Centrum Informatyki AGH",
            address: "Kraków Kawiory 21, 30-055",
            description: "Budynek ma dziwną numerację poziomów - parter to 1, nie 0. Mo-Su 06:00-22:00",
            imageName: "MainImage",
            isForDisabled: .yes,
            isWiFi: true,
            map: "Map",
            building: .univerity,
            polygon: MKPolygon(coordinates: [
                CLLocationCoordinate2D(latitude: 19.912784, longitude: 50.0672586),
                CLLocationCoordinate2D(latitude: 19.9127486, longitude: 50.067163),
                CLLocationCoordinate2D(latitude: 19.9128873, longitude: 50.0671416),
                CLLocationCoordinate2D(latitude: 19.9129232, longitude: 50.0672372)
              ], count: 4),
            favourite: false
        ),
        Building(
            name: "U-3",
            subName: "Przychodnia Akademicka",
            address: "Kraków Akademicka 5, 30-055",
            description: "Fusce volutpat leo nunc, id lobortis ligula porta in. Mo-Fr 08:00-18:00",
            imageName: "MainImage",
            isForDisabled: .no,
            isWiFi: false,
            map: "Map",
            building: .other,
            polygon: MKPolygon(coordinates: [
                CLLocationCoordinate2D(latitude: 19.912784, longitude: 50.0672586),
                CLLocationCoordinate2D(latitude: 19.9127486, longitude: 50.067163),
                CLLocationCoordinate2D(latitude: 19.9128873, longitude: 50.0671416),
                CLLocationCoordinate2D(latitude: 19.9129232, longitude: 50.0672372)
              ], count: 4),
            favourite: false
        ),
        Building(
            name: "D-16",
            subName: "Wydział Fizyki",
            address: "Kraków Kawiory 30, 30-055",
            description: "Fusce volutpat leo nunc, id lobortis ligula porta in. Nulla varius lorem ac magna condimentum dapibus. Vestibulum pulvinar justo a ex tincidunt.",
            imageName: "MainImage",
            isForDisabled: .limited,
            isWiFi: false,
            map: "Map",
            building: .univerity,
            polygon: MKPolygon(coordinates: [
                CLLocationCoordinate2D(latitude: 19.912784, longitude: 50.0672586),
                CLLocationCoordinate2D(latitude: 19.9127486, longitude: 50.067163),
                CLLocationCoordinate2D(latitude: 19.9128873, longitude: 50.0671416),
                CLLocationCoordinate2D(latitude: 19.9129232, longitude: 50.0672372)
              ], count: 4),
            favourite: false
        ),
    ]
}




