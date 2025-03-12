//
//  ContentView.swift
//  JPApexPredators
//
//  Created by ho.duc.haib on 3/10/25.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    
    var body: some View {
        List(predators.apexPredators) { p in
            
            HStack {
                Image(p.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                VStack(alignment: .leading) {
                    Text(p.name)
                        .fontWeight(.bold)
                    Text(p.type.rawValue.capitalized)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 13)
                        .padding(.vertical, 5)
                        .background(p.type.background)
                        .clipShape(.capsule)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
