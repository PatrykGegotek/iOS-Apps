//
//  ContentView.swift
//  Lab1
//
//  Created by Guest User on 06/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showLimitedIcon = true // Define a boolean variable
    var body: some View {
        VStack {
            Image("MainImage") // Replace "topImage" with the name of your top image asset
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 330.0, height: 165.0) // Adjust the height of the top image as needed
            
            Text("Budynek DS-16")
                .font(.largeTitle)
                .padding([.leading, .trailing])
            
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 0.0) {
                    Text("Dom Studencki Itaka")
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        
                    
                    Text("Ul. Tokarskiego 10 30-065 Kraków")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        
                }
                .padding(/*@START_MENU_TOKEN@*/.all, 1.0/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                if showLimitedIcon {
                    Image(systemName: "figure.roll") // Use this icon when showAlternateIcon is true
                        .font(.title)
                        .foregroundColor(Color.gray) // Set the color to blue when showAlternateIcon is true
                        .padding(1.0)
                } else {
                    Image(systemName: "figure.roll") // Use this icon when showAlternateIcon is false
                        .font(.title)
                        .foregroundColor(Color.black) // Set the color to red when showAlternateIcon is false
                        .padding(1.0)
                }
                
            }
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
            
            
            Text("Fusce volutpat leo nunc, id lobortis ligula porta in. Nulla varius lorem ac magna condimentum dapibus. Vestibulum pulvinar justo a ex tincidunt, a pulvinar tortor mollis. Aliquam hendrerit pretium sollicitudin.")
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

#Preview {
    ContentView()
}
