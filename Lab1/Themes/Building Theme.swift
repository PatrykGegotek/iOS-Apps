import Foundation
import UIKit
import SwiftUI

class Theme {
    static func backgroundColor(for buildingType: BuildingType) -> Color {
        var color: Color
        
        switch buildingType {
        case .dormitory:
            color = .gray
        case .university:
            color = .pink
        case .other:
            color = .orange
        }
        
        return color
    }
    
    static func textColor(for buildingType: BuildingType) -> Color {
        var color: Color
        
        switch buildingType {
        case .dormitory:
            color = .black
        case .university:
            color = .green
        case .other:
            color = .gray
        }
        
        return color
    }
}
