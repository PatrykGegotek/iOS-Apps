//
//  BuildingListsView.swift
//  Lab1
//
//  Created by Guest User on 13/10/2023.
//

import SwiftUI
import MapKit


struct BuildingListView: View {
    var buildings: [Building] = Building.sampleBuildings
    
    @State private var selectedBuilding: Building?
    @State private var isBuildingDetailViewPresented = false
    
    var body: some View {
        NavigationStack {
            List(buildings) { building in
                Button(action: {
                    self.selectedBuilding = building
                    self.isBuildingDetailViewPresented.toggle()
                }) {
                    HStack {
                        Text(building.name)
                            .font(.headline)
                            .foregroundColor(Theme.textColor(for: building.building))
                        .multilineTextAlignment(.leading)
                        Spacer()
                        Image(systemName: (building.favourite ? "heart.fill" : "heart"))
                            .font(.title3)
                    }
                    HStack {
                        Text(building.subName)
                            .foregroundColor(Theme.textColor(for: building.building))
                        Spacer()
                        Image(systemName: (building.isWiFi ? "wifi" : "wifi.slash"))
                            .font(.title3)
                            .foregroundColor(building.isWiFi ? Color.blue : Color.gray) // Set the color to blue when showLimitedIcon is true, otherwise gray
                            .padding(1.0)
                        Image(systemName: "figure.roll")
                            .font(.title3)
                            .foregroundColor(
                            building.isForDisabled == .yes ? Color.blue :
                                (building.isForDisabled == .limited ? Color.yellow : Color.gray)
                            )
                            .padding(1.0)
                    }
                    
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .onAppear {
                    // This code will be executed when the view appears on the screen
                    print(building)
                }
                .listRowBackground(Theme.backgroundColor(for: building.building))
                .listRowSeparator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/)
                
            }
            .sheet(isPresented: $isBuildingDetailViewPresented) {
                if let selectedBuilding = self.selectedBuilding {
                    BuildingDetailView(building: selectedBuilding)
                }
            }
        }
    }
}

#Preview {
    BuildingListView()
}
