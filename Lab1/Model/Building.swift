import Foundation
import MapKit

enum DisabledAccessibility: String, Codable {
    case yes
    case no
    case limited
}

enum BuildingType: String, Codable {
    case dormitory
    case university
    case other
}

struct Building: Identifiable, Codable {
    var id = UUID()
    var symbol: String
    var name: String
    var street: String
    var description: String
    var imageURL: String
    var wheelchair: DisabledAccessibility
    var wifi: Bool
    var map: String
    var type: BuildingType
    var polygon: MKPolygon
    var favourite: Bool

    // Custom coding keys to handle the custom types
    private enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case street
        case description
        case imageURL
        case wheelchair
        case wifi
        case type
        case polygon
    }

    // Implement encode and decode methods manually for MKPolygon
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(symbol, forKey: .symbol)
        try container.encode(name, forKey: .name)
        try container.encode(street, forKey: .street)
        try container.encode(description, forKey: .description)
        try container.encode(imageURL, forKey: .imageURL)
        try container.encode(wheelchair, forKey: .wheelchair)
        try container.encode(wifi, forKey: .wifi)
        try container.encode(type, forKey: .type)
//        try container.encode(favourite, forKey: .favourite)/

        // Convert MKPolygon to a format that can be encoded
        let polygonData = try NSKeyedArchiver.archivedData(withRootObject: polygon, requiringSecureCoding: false)
        try container.encode(polygonData, forKey: .polygon)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        symbol = try container.decode(String.self, forKey: .symbol)
        name = (try? container.decode(String.self, forKey: .name)) ?? "budynek"
        street = try container.decode(String.self, forKey: .street)
        description = try container.decode(String.self, forKey: .description)
        imageURL = (try? container.decode(String.self, forKey: .imageURL)) ?? "https://tools.sokoloowski.pl/pum-api/static/images/c-1.jpg"
        wheelchair = try container.decode(DisabledAccessibility.self, forKey: .wheelchair)
        wifi = try container.decode(Bool.self, forKey: .wifi)
        map = "map"
        type = (try? container.decode(BuildingType.self, forKey: .type)) ?? BuildingType.other
        favourite = false

        var coordinates: [CLLocationCoordinate2D] = []
        
//        if let singleName = try? container.decode(String.self, forKey: .name) {
//            name = singleName
//        } else if var nameArray = try? container.nestedUnkeyedContainer(forKey: .name) {
//            // Handle the case where name is an array of strings
//            var names: [String] = []
//            while !nameArray.isAtEnd {
//                if let singleName = try? nameArray.decode(String.self) {
//                    names.append(singleName)
//                }
//            }
//            name = names.joined(separator: ", ")  // Combine names into a single string
//        } else {
//            throw DecodingError.dataCorruptedError(forKey: .name, in: container, debugDescription: "Failed to decode name.")
//        }
        
        polygon = MKPolygon(coordinates: &coordinates, count: coordinates.count)
    }
    
//    static var sampleBuildings: [Building] = [
//        Building(
//            name: "DS-16",
//            subName: "Dom Studencki Itaka",
//            address: "Ul. Tokarskiego 10, 30-065 Kraków",
//            description: "Fusce volutpat leo nunc, id lobortis ligula porta in. Nulla varius lorem ac magna condimentum dapibus. Vestibulum pulvinar justo a ex tincidunt, a pulvinar tortor mollis. Aliquam hendrerit pretium sollicitudin.",
//            imageName: "MainImage",
//            isForDisabled: .limited,
//            isWiFi: true,
//            map: "Map",
//            building: .dormitory,
//            polygon: MKPolygon(coordinates: [
//                CLLocationCoordinate2D(latitude: 19.912784, longitude: 50.0672586),
//                CLLocationCoordinate2D(latitude: 19.9127486, longitude: 50.067163),
//                CLLocationCoordinate2D(latitude: 19.9128873, longitude: 50.0671416),
//                CLLocationCoordinate2D(latitude: 19.9129232, longitude: 50.0672372)
//              ], count: 4),
//            favourite: false
//        ),
//        Building(
//            name: "D-17",
//            subName: "Centrum Informatyki AGH",
//            address: "Kraków Kawiory 21, 30-055",
//            description: "Budynek ma dziwną numerację poziomów - parter to 1, nie 0. Mo-Su 06:00-22:00",
//            imageName: "MainImage",
//            isForDisabled: .yes,
//            isWiFi: true,
//            map: "Map",
//            building: .univerity,
//            polygon: MKPolygon(coordinates: [
//                CLLocationCoordinate2D(latitude: 19.912784, longitude: 50.0672586),
//                CLLocationCoordinate2D(latitude: 19.9127486, longitude: 50.067163),
//                CLLocationCoordinate2D(latitude: 19.9128873, longitude: 50.0671416),
//                CLLocationCoordinate2D(latitude: 19.9129232, longitude: 50.0672372)
//              ], count: 4),
//            favourite: false
//        ),
//        Building(
//            name: "U-3",
//            subName: "Przychodnia Akademicka",
//            address: "Kraków Akademicka 5, 30-055",
//            description: "Fusce volutpat leo nunc, id lobortis ligula porta in. Mo-Fr 08:00-18:00",
//            imageName: "MainImage",
//            isForDisabled: .no,
//            isWiFi: false,
//            map: "Map",
//            building: .other,
//            polygon: MKPolygon(coordinates: [
//                CLLocationCoordinate2D(latitude: 19.912784, longitude: 50.0672586),
//                CLLocationCoordinate2D(latitude: 19.9127486, longitude: 50.067163),
//                CLLocationCoordinate2D(latitude: 19.9128873, longitude: 50.0671416),
//                CLLocationCoordinate2D(latitude: 19.9129232, longitude: 50.0672372)
//              ], count: 4),
//            favourite: false
//        ),
//        Building(
//            name: "D-16",
//            subName: "Wydział Fizyki",
//            address: "Kraków Kawiory 30, 30-055",
//            description: "Fusce volutpat leo nunc, id lobortis ligula porta in. Nulla varius lorem ac magna condimentum dapibus. Vestibulum pulvinar justo a ex tincidunt.",
//            imageName: "MainImage",
//            isForDisabled: .limited,
//            isWiFi: false,
//            map: "Map",
//            building: .univerity,
//            polygon: MKPolygon(coordinates: [
//                CLLocationCoordinate2D(latitude: 19.912784, longitude: 50.0672586),
//                CLLocationCoordinate2D(latitude: 19.9127486, longitude: 50.067163),
//                CLLocationCoordinate2D(latitude: 19.9128873, longitude: 50.0671416),
//                CLLocationCoordinate2D(latitude: 19.9129232, longitude: 50.0672372)
//              ], count: 4),
//            favourite: false
//        ),
//    ]
}




