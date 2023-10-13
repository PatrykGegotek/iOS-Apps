//
//  BuildingListsView.swift
//  Lab1
//
//  Created by Guest User on 13/10/2023.
//

import SwiftUI

struct BuildingListView: View {
    let buildings: [Building] = [
        Building(
            name: "Budynek DS-16",
            subName: "Dom Studencki Itaka",
            address: "Ul. Tokarskiego 10, 30-065 Kraków",
            description: "Fusce volutpat leo nunc, id lobortis ligula porta in. Nulla varius lorem ac magna condimentum dapibus. Vestibulum pulvinar justo a ex tincidunt, a pulvinar tortor mollis. Aliquam hendrerit pretium sollicitudin.",
            imageName: "MainImage",
            isForDisabled: .limited,
            isWiFi: true,
            map: "Map"
        ),
        Building(
            name: "D-17",
            subName: "Centrum Informatyki AGH",
            address: "Kraków Kawiory 21, 30-055",
            description: "Budynek ma dziwną numerację poziomów - parter to 1, nie 0. Mo-Su 06:00-22:00",
            imageName: "MainImage",
            isForDisabled: .yes,
            isWiFi: true,
            map: "Map"
        ),
        Building(
            name: "D-16",
            subName: "Wydział Fizyki",
            address: "Kraków Kawiory 30, 30-055",
            description: "Fusce volutpat leo nunc, id lobortis ligula porta in. Nulla varius lorem ac magna condimentum dapibus. Vestibulum pulvinar justo a ex tincidunt.",
            imageName: "MainImage",
            isForDisabled: .limited,
            isWiFi: false,
            map: "Map"
        ),
        Building(
            name: "U-3",
            subName: "Przychodnia Akademicka",
            address: "Kraków Akademicka 5, 30-055",
            description: "Fusce volutpat leo nunc, id lobortis ligula porta in. Mo-Fr 08:00-18:00",
            imageName: "MainImage",
            isForDisabled: .no,
            isWiFi: false,
            map: "Map"
        ),
    ]
    
    @State private var selectedBuilding: Building?
    @State private var isBuildingDetailViewPresented = false
    
    var body: some View {
        NavigationView {
            List(buildings) { building in
                Button(action: {
                    self.selectedBuilding = building
                    self.isBuildingDetailViewPresented.toggle()
                }) {
                    Text(building.name)
                }.onAppear {
                    // This code will be executed when the view appears on the screen
                    print(building)
                }
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
