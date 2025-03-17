//
//  PredatorMap.swift
//  JPApexPredators
//
//  Created by ho.duc.haib on 3/17/25.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    
    let predators = Predators()
    
    @State var position: MapCameraPosition
    @State var satellite = false
    
    var body: some View {
        Map(position: $position) {
            ForEach(predators.rawApexPredators) { p in
                Annotation(p.name, coordinate: p.location) {
                    Image(p.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white, radius: 3)
                }
            }
        }
        .mapStyle(satellite ? .imagery(elevation: .realistic): .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing) {
            Button{
                   satellite.toggle()
            } label :  {
                Image(systemName: satellite ? "globe.americas.fill": "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(3)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 7))
                    .shadow(radius: 3)
                    .padding()
                
            }
        }
    }
}

#Preview {
    let p = Predators().rawApexPredators[1];
    PredatorMap(position: .camera(
        MapCamera(
            centerCoordinate: p.location,
            distance: 1000,
            heading: 250,
            pitch: 80)
    )

    )
    .preferredColorScheme(.dark)
}
