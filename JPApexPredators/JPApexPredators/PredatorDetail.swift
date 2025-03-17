//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by ho.duc.haib on 3/13/25.
//

import SwiftUI
import MapKit

struct PredatorDetail: View {
    
    
    
    let predator: ApexPredator
    
    @State var position: MapCameraPosition;
    
    @Namespace var namespace
    
    
    var body: some View {
        GeometryReader { geo in
        
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay{
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(color: .clear, location: 0.8),
                                    Gradient.Stop(color: .black, location: 1),
                                ],
                                           startPoint: .top,
                                           endPoint: .bottom
                            )
                        }
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                    
                }
                VStack(alignment: .leading) {
                    Text(predator.name)
                        .font(.largeTitle)
                    
                    NavigationLink {
                        PredatorMap(position: .camera(
                            MapCamera(
                                centerCoordinate: predator.location,
                                distance: 1000,
                                heading: 250,
                                pitch: 80)
                        ))
                        .navigationTransition(.zoom(sourceID: 1, in: namespace))
                    } label: {
                        Map(position: $position) {
                            Annotation(predator.name, coordinate: predator.location) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                                
                            }
                        }
                        .frame(height: 150)
                        .overlay(alignment: .trailing) {
                            Image(systemName: "greaterthan")
                                .imageScale(.large)
                                .font(.title3)
                                .padding(.trailing, 5)
                        }
                        .overlay(alignment: .topLeading) {
                            Text("Current Location")
                                .padding([.leading, .bottom], 5)
                                .padding(.trailing, 8)
                                .background(.black.opacity(0.33))
                                .clipShape(.rect(bottomTrailingRadius: 8))
                            
                        }
                        .clipShape(.rect(cornerRadius: 8))
                    }
                    .matchedTransitionSource(id: 1, in: namespace)
                   
                    
                    Text("Appears In:")
                        .font(.title3)
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("• " + movie)
                            .font(.subheadline)
                            .padding()
                    }
                    Text("Movie Moments")
                        .font(.title3)
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                        
                    }
                    Text("Read More:")
                        .font(.caption)
                    Link(predator.link, destination: URL(string:  predator.link)!)
                        .padding(.bottom)
                    
                }
                .padding()
                .frame(width: geo.size.width, alignment: .leading)
                .preferredColorScheme(.dark)
                
            }
        }
        .ignoresSafeArea()
        .toolbarBackground(.background)
    }
}

#Preview {
    let p = Predators().rawApexPredators[1];
    NavigationStack {
        PredatorDetail(predator: p, position: .camera(MapCamera(centerCoordinate: p.location, distance: 30000)))
    }
}
