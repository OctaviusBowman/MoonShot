//
//  Mission.swift
//  Moonshot
//
//  Created by Octavius Bowman on 11/6/21.
//

import Foundation



struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        var name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var crewNames: String {
        var names = String()
        for i in crew {
            names += i.name + " "
        }
        return names.capitalized
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
}
