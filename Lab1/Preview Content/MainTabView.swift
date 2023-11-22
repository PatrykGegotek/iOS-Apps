import SwiftUI
import MapKit

struct MainTabView: View {
    var body: some View {
        TabView {
            BuildingListView()
                .tabItem {
                    Label("Budynki", systemImage: "building.2")
                }

            UserLocationMapView()
                .tabItem {
                    Label("Mapa", systemImage: "map")
                }
        }
    }
}
