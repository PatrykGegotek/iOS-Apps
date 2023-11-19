import Foundation

class DataManager: ObservableObject {
    static let shared = DataManager()

    private var buildings: [Building] = []

    // Ścieżka do lokalnego pliku JSON w katalogu dokumentów
    private let localDataURL: URL = {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Nie można uzyskać dostępu do katalogu dokumentów.")
        }
        return documentsURL.appendingPathComponent("buildings.json")
    }()

    // URL do API
    private let apiURL = URL(string: "https://tools.sokoloowski.pl/pum-api/")!

    private init() {
        // Odczytaj dane z pliku lub z API przy inicjalizacji
        loadData()
    }

    func getBuildings() -> [Building] {
        return buildings
    }

    private func loadData() {
        // Sprawdź, czy plik lokalny istnieje
        if FileManager.default.fileExists(atPath: localDataURL.path) {
            do {
                // Wczytaj dane z pliku
                let data = try Data(contentsOf: localDataURL)
                let decodedBuildings = try JSONDecoder().decode([Building].self, from: data)
                self.buildings = decodedBuildings
            } catch {
                print("Błąd podczas wczytywania danych z pliku: \(error)")
            }
        } else {
            // Pobierz dane z API, jeżeli plik nie istnieje
            fetchDataFromAPI()
        }
    }

    private func fetchDataFromAPI() {
        URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Błąd podczas pobierania danych z API: \(error?.localizedDescription ?? "Nieznany błąd")")
                return
            }

            do {
                // Zdekoduj pobrane dane
                let decodedBuildings = try JSONDecoder().decode([Building].self, from: data)
                self.buildings = decodedBuildings
                print("Dane pobrane")
                // Zapisz dane do pliku lokalnego
                self.saveDataToLocalFile()
            } catch {
                print("Błąd podczas deserializacji danych z API: \(error)")
            }
        }.resume()
    }

    private func saveDataToLocalFile() {
        do {
            // Zapisz dane do pliku lokalnego
            let encodedData = try JSONEncoder().encode(buildings)
            try encodedData.write(to: localDataURL)
            print("Dane zapisane do: \(localDataURL)")
        } catch {
            print("Błąd podczas zapisywania danych do pliku: \(error)")
        }
    }
}
