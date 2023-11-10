import SwiftUI
import MapKit

struct BuildingDetailView: View {
    
    var building: Building
    
    @State private var showLimitedIcon = true // Define a boolean variable
    var body: some View {
        VStack {
            Image(building.imageURL) // Replace "topImage" with the name of your top image asset
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 330.0, height: 165.0) // Adjust the height of the top image as needed
            
            HStack {
                Text(building.symbol)
                    .font(.largeTitle)
                .padding([.leading, .trailing])
                Spacer()
                Button(action: {
                        
                    }) {
                        Image(systemName: building.favourite ? "heart.fill" : "heart")
                            .padding(.trailing, 20.0)
                            .font(.title)
                    }
            }
            
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 0.0) {
                    Text(building.name)
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(building.street)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(/*@START_MENU_TOKEN@*/.all, 1.0/*@END_MENU_TOKEN@*/)
                Spacer()
                Image(systemName: (building.wifi ? "wifi" : "wifi.slash"))
                    .font(.title)
                    .foregroundColor(building.wifi ? Color.blue : Color.gray) // Set the color to blue when showLimitedIcon is true, otherwise gray
                    .padding(1.0)
                Image(systemName: "figure.roll")
                    .font(.title)
                    .foregroundColor(
                        building.wheelchair == .yes ? Color.blue :
                            (building.wheelchair == .limited ? Color.yellow : Color.gray)
                    )
                    .padding(1.0)
                
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            
            
            Text(building.description)
                .font(.body)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            
            
            
            Image("Map") // Replace "bottomImage" with the name of your bottom image asset
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250) // Adjust the height of the bottom image as needed
        }
    }
}

//#Preview {
//    BuildingDetailView(building: Building(
//        name: "Budynek DS-16",
//        subName: "Dom Studencki Itaka",
//        address: "Ul. Tokarskiego 10, 30-065 Kraków",
//        description: "Fusce volutpat leo nunc, id lobortis ligula porta in. Nulla varius lorem ac magna condimentum dapibus. Vestibulum pulvinar justo a ex tincidunt, a pulvinar tortor mollis. Aliquam hendrerit pretium sollicitudin.",
//        imageName: "MainImage",
//        isForDisabled: .limited,
//        isWiFi: true,
//        map: "Map",
//        building: .dormitory,
//        polygon: MKPolygon(coordinates: [
//            CLLocationCoordinate2D(latitude: 19.912784, longitude: 50.0672586),
//            CLLocationCoordinate2D(latitude: 19.9127486, longitude: 50.067163),
//            CLLocationCoordinate2D(latitude: 19.9128873, longitude: 50.0671416),
//            CLLocationCoordinate2D(latitude: 19.9129232, longitude: 50.0672372)
//          ], count: 4),
//        favourite: false
//    ))
//}
