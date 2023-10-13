
import Foundation

enum DisabledAccessibility: String {
    case yes
    case no
    case limited
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
    
}


