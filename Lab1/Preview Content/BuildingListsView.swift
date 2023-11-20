import SwiftUI
import MapKit


struct BuildingListView: View {
    
    @ObservedObject var dataManager = DataManager.shared
    @State private var showingAlert = false
    
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
                                .foregroundColor(Color.red)
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
                .listRowBackground(Theme.backgroundColor(for: building.type))
                .listRowSeparator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("Lista Budynków")
            .toolbar {
                Button("Odśwież dane") {
                    showingAlert = true
                }
            }
            .alert("Dane aplikacji zostaną zastąpione nowymi!", isPresented: $showingAlert) {
                Button("OK", role: .destructive) {
                    fetchData()
                }
                Button("Anuluj", role: .cancel) {}
            }
        }
    }
    
    func fetchData() {
        // Tutaj umieść logikę do odświeżania danych z API
                    dataManager.fetchDataFromAPI()
//        dataManager.fetchDataFromAPI { result in
//            switch result {
//            case .success(let newBuildings):
//                // Aktualizuj dane w aplikacji nowymi danymi z API
//                DispatchQueue.main.async {
//                    self.dataManager.buildings = newBuildings
//                }
//            case .failure(let error):
//                // Obsługa błędów, na przykład wyświetlenie komunikatu o błędzie
//                print("Wystąpił błąd podczas pobierania danych: \(error.localizedDescription)")
//            }
//        }
    }
}
