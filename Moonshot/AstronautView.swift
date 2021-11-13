//
//  AstronautView.swift
//  Moonshot
//
//  Created by Octavius Bowman on 11/6/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var missions: [Mission]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.self.description)
                        .padding()
                    
                    VStack(alignment: .center){
                        Text("Missions flown on: ").font(.system(size: 25)).bold()
                        ForEach(self.missions) { mission in
                            HStack{
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                Text(mission.displayName).font(.headline).bold()
                                Text(mission.formattedLaunchDate)
                            }
                        }
                    }
                }
            }
            
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        self.missions = missions
        
        var matches = [Mission]()
        
        for mission in missions {
            if let match = mission.crew.first(where: { $0.name  == self.astronaut.id}) {
                matches.append(mission)
            }
        }
        self.missions = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
