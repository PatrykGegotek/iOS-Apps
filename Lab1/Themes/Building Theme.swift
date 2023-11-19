import Foundation
import UIKit
import SwiftUI

class Theme {
    static func backgroundColor(for buildingType: BuildingType) -> Color {
        var color: Color
        
        switch buildingType {
        case .dormitory:
            color = .red
        case .university:
            color = .cyan
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
            color = .yellow
        case .other:
            color = .blue
        }
        
        return color
    }
}
