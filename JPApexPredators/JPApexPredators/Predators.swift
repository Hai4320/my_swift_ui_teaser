//
//  Predators.swift
//  JPApexPredators
//
//  Created by ho.duc.haib on 3/11/25.
//

import Foundation

class Predators {
    var rawApexPredators: [ApexPredator] = []
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredators()
    }
    
    
    func decodeApexPredators(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                rawApexPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print(" decodeApexPredators Error: \(error)")
            }
        }
    }
    
    func searchPredator(name: String) -> [ApexPredator] {
        guard !name.isEmpty else {
            return apexPredators
        }
        
        return apexPredators.filter { $0.name.lowercased().contains(name.lowercased()) }
    }
    
    func sortPredators(alphabetical: Bool) {
        if alphabetical {
            apexPredators =  apexPredators.sorted { $0.name < $1.name }
        } else {
            apexPredators =   apexPredators.sorted { $0.id < $1.id }
        }
    }
    
    func filterPredators(withType type: ApexPredator.APType) {
        if type == .all {
            return
        }
        apexPredators =  apexPredators.filter { $0.type == type }
    }
}
