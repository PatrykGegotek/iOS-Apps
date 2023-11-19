//
//  BuildingListsView.swift
//  Lab1
//
//  Created by Guest User on 13/10/2023.
//

import SwiftUI
import MapKit


struct BuildingListView: View {
//    @State private var buildings: [Building] = []
//    
//    @State private var selectedBuilding: Building?
//    @State private var isBuildingDetailViewPresented = false
    
    @ObservedObject var dataManager = DataManager.shared
    
    var body: some View {
            NavigationStack {
                List(dataManager.getBuildings()) { building in
                    NavigationLink(destination: BuildingDetailView(building: building)) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(building.symbol)
                                    .font(.headline)
                                    .foregroundColor(Theme.textColor(for: building.type))
                                Spacer()
                                Image(systemName: building.favourite ? "heart.fill" : "heart")
                                    .font(.title3)
                            }
                            
                            HStack {
                                Text(building.name)
                                    .foregroundColor(Theme.textColor(for: building.type))
                                Spacer()
                                Image(systemName: building.wifi ? "wifi" : "wifi.slash")
                                    .font(.title3)
                                    .foregroundColor(building.wifi ? Color.blue : Color.gray)
                                    .padding(1.0)
                                Image(systemName: "figure.roll")
                                    .font(.title3)
                                    .foregroundColor(
                                        building.wheelchair == .yes ? Color.blue :
                                            (building.wheelchair == .limited ? Color.yellow : Color.gray)
                                    )
                                    .padding(1.0)
                            }
                        }
                    }
//                    .background(Theme.backgroundColor(for: building.type))
                    .listRowBackground(Theme.backgroundColor(for: building.type))
                                    .listRowSeparator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/)
                }
                .navigationTitle("Lista Budynków")
            }
        }
    
//    var body: some View {
//        NavigationStack {
//            List(buildings) { building in
//                Button(action: {
//                    self.selectedBuilding = building
//                    self.isBuildingDetailViewPresented.toggle()
//                }) {
//                    HStack {
//                        Text(building.symbol)
//                            .font(.headline)
//                            .foregroundColor(Theme.textColor(for: building.type))
//                        .multilineTextAlignment(.leading)
//                        Spacer()
//                        Image(systemName: (building.favourite ? "heart.fill" : "heart"))
//                            .font(.title3)
//                    }
//                    HStack {
//                        Text(building.name)
//                            .foregroundColor(Theme.textColor(for: building.type))
//                        Spacer()
//                        Image(systemName: (building.wifi ? "wifi" : "wifi.slash"))
//                            .font(.title3)
//                            .foregroundColor(building.wifi ? Color.blue : Color.gray) // Set the color to blue when showLimitedIcon is true, otherwise gray
//                            .padding(1.0)
//                        Image(systemName: "figure.roll")
//                            .font(.title3)
//                            .foregroundColor(
//                            building.wheelchair == .yes ? Color.blue :
//                                (building.wheelchair == .limited ? Color.yellow : Color.gray)
//                            )
//                            .padding(1.0)
//                    }
//                    
//                    
//                }
//                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//                .onAppear {
//                    // This code will be executed when the view appears on the screen
//                    print(building)
//                }
//                .listRowBackground(Theme.backgroundColor(for: building.type))
//                .listRowSeparator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/)
//                
//            }
//            .sheet(isPresented: $isBuildingDetailViewPresented) {
//                if let selectedBuilding = self.selectedBuilding {
//                    BuildingDetailView(building: selectedBuilding)
//                }
//            }
//            .onAppear {
//                self.buildings = DataManager.shared.getBuildings()
//            }
//        }
//    }
}

//#Preview {
//    BuildingListView()
//}
