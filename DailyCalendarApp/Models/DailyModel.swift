//
//  DailyModel.swift
//  DailyCalendarApp
//
//  Created by Владислав Клепиков on 27.06.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import Foundation

struct Daily {
    let id: Int
    let name: String
    let description: String
    let date_start: Int
    let date_finish: Int
    
    static let dailies = [
        Daily(id: 1,
              name: "Tusovka",
              description: "Segodnja tusim",
              date_start: 1593241200,
              date_finish: 1593244800),
        Daily(id: 2,
              name: "Obed",
              description: "Kushaem",
              date_start: 1592996400,
              date_finish: 1593000000)
    ]
        
    static func getDailies() -> [Daily] {
        return dailies
    }
}
