import Foundation
import CoreLocation

class Dino {
    
    let name: String!
    let location: CLLocationCoordinate2D!
    let fact: String!
    var facts: [String]!

    var region: CLCircularRegion {
        return CLCircularRegion(center: location, radius: 50, identifier: name)
    }
    
    init(name: String, fact: String, location: CLLocationCoordinate2D) {
        self.name = name
        self.location = location
        self.fact = fact
    }
    
}


func buildDinos() -> [Dino] {
    var dinos = [Dino]()
    
    let tRex = Dino(name: "T-Rex", fact: "I have 12-13 feet tall at hips (the hips would have been twice as tall as a tall man.", location: CLLocationCoordinate2D(latitude: 50.719799, longitude: -1.879439))
    tRex.facts = ["I' am as heavy as about 200 10-year-old children.", "I have tiny arm that dont even reach my mouth", "I' am extremely good at sniffing out food. The part of my brain used for smelling is as big as an orange.", "I' am even longer and taller than a double decker bus."]
    dinos.append(tRex)
    
    let eoraptor = Dino(name: "Eoraptor", fact: "I lived on the Earth 240 million years. I appeared at the same time when dinosaurs appeared.", location: CLLocationCoordinate2D(latitude: 50.716098, longitude: -1.875780))
    eoraptor.facts = ["I' am one of the earliest known dinosaurs", "I was a small, lightly-built dinosaur that walked on two long legs. ", "I was a very quick and nimble dinosaur. I had no trouble catching small animals, such as lizards", "I was an extremely intelligent dinosaur with many of my friends calling me a miniature version of the T-Rex."]
    dinos.append(eoraptor)
    
    let teradaxtyl = Dino(name: "Teradaxtyl", fact: "I lived on earth around 228,000,000 Years Ago", location: CLLocationCoordinate2D(latitude: 50.719914, longitude: -1.843552))
    teradaxtyl.facts = ["My dinosaur firends gave me a nickname of the winged lizard.", "I tended to live in caves and trees. I ate large insects and lived near the sea.", "Unlike most flying reptiles I had fingers.", "My wings were made of a leathery substance."]
    dinos.append(teradaxtyl)
    
    
    return dinos
}


func loadDino(dinoName: String) -> Dino! {
    
    let dinos = buildDinos()
    
    for dino in dinos {
        if dino.name == dinoName {
            return dino
        }
    }
    
    return nil
}


