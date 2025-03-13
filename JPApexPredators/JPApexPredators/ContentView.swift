//
//  ContentView.swift
//  JPApexPredators
//
//  Created by ho.duc.haib on 3/10/25.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    
    @State private var searchText: String = ""
    
    @State var alphebetical = false
    
    @State var currentSelectedPredatorType: ApexPredator.APType = .all
    
    var filteredPredators: [ApexPredator] {
        predators.apexPredators = predators.rawApexPredators
        predators.filterPredators(withType: currentSelectedPredatorType)
        predators.sortPredators(alphabetical: alphebetical)
        return predators.searchPredator(name: searchText)
    }
    
    var body: some View {
        NavigationStack{
                
                List(filteredPredators) { p in
                    NavigationLink{
                        Image(p.image)
                            .resizable()
                            .scaledToFit()
                    } label: {
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
            }
                .navigationTitle("Apex Predators")
                .searchable(text: $searchText)
                .autocorrectionDisabled()
                .navigationBarBackButtonHidden(true)
                .animation(.default, value: searchText)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button{
                            withAnimation{
                                alphebetical.toggle()
                            }
                        } label: {
                            Image(systemName: alphebetical ? "film" : "textformat")
                                .symbolEffect(.bounce, value: alphebetical)
                                .foregroundStyle(.white)
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu {
                            Picker("Filter", selection: $currentSelectedPredatorType) {
                                ForEach(ApexPredator.APType.allCases) { t in
                                    Label(t.rawValue.capitalized, systemImage: t.icon)
                                }
                            }
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundStyle(.white)
                        }
                    }
                }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
