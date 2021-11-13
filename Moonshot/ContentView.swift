//
//  ContentView.swift
//  Moonshot
//
//  Created by Octavius Bowman on 11/5/21.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isShowingCrewNames = true
    
    var body: some View {
        NavigationView{
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts, missions: self.missions)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if self.isShowingCrewNames {
                            Text("Crew Names \(mission.crewNames)")
                        } else {
                            Text(mission.formattedLaunchDate)
                        }
                    }
                }
            }.navigationBarTitle("Moonshot")
                .navigationBarItems(trailing: Toggle(isOn: $isShowingCrewNames, label: {
                    Text("Crew Names")
                }))
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        //Resizable Images
        
//        VStack {
////            GeometryReader { geo in
//                Image("Nord Piano 4 88 Keys")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
////                    .frame(width: geo.size.width)
////            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
