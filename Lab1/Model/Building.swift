import Foundation
import MapKit


extension MKPolygon {
    var coordinates: [CLLocationCoordinate2D] {
        var coords = [CLLocationCoordinate2D](repeating: CLLocationCoordinate2D(), count: self.pointCount)
        self.getCoordinates(&coords, range: NSRange(location: 0, length: self.pointCount))
        return coords
    }
}

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

class Building: Identifiable, Codable, ObservableObject {
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
    @Published var favourite: Bool

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
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        symbol = try container.decode(String.self, forKey: .symbol)
        name = (try? container.decode(String.self, forKey: .name)) ?? "budynek"
        street = try container.decode(String.self, forKey: .street)
        description = try container.decode(String.self, forKey: .description)
        imageURL = (try? container.decode(String.self, forKey: .imageURL)) ?? "ttps://tools.sokoloowski.pl/pum-api/static/images/a-4.jpg"
        wheelchair = try container.decode(DisabledAccessibility.self, forKey: .wheelchair)
        wifi = try container.decode(Bool.self, forKey: .wifi)
        map = "map"
        type = (try? container.decode(BuildingType.self, forKey: .type)) ?? BuildingType.other
        favourite = false
        
        
        if let coordinateArray = try? container.decode([[String: Double]].self, forKey: .polygon) {
            let coordinates = coordinateArray.map { CLLocationCoordinate2D(latitude: $0["lat"] ?? 0, longitude: $0["lon"] ?? 0) }
            polygon = MKPolygon(coordinates: coordinates, count: coordinates.count)
        } else {
            polygon = MKPolygon()
        }

    }
}

func convertStringToCoordinates(_ string: String) -> [CLLocationCoordinate2D] {
    guard let data = Data(base64Encoded: string) else {
        print("Nie można zdekodować danych base64.")
        return []
    }

    do {
        if let array = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [[String: Any]] {
            return array.compactMap { dict in
                guard let latitude = dict["lat"] as? Double,
                      let longitude = dict["lon"] as? Double else {
                    return nil
                }
                return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            }
        } else {
            print("Niepoprawny format plist.")
            return []
        }
    } catch {
        print("Błąd podczas dekodowania plist: \(error)")
        return []
    }
}


