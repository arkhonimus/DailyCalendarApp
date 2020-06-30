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
    var name: String
    let description: String
    let date_start: Int
    let date_finish: Int
    
    static let dailies = [
        Daily(id: 1,
              name: "Встреча",
              description: "Встреча с Борисом Андреевичем",
              date_start: 1593223200,
              date_finish: 1593226800),
        Daily(id: 2,
              name: "Обед",
              description: "Не забыть сходить в новое кафе",
              date_start: 1593244800,
              date_finish: 1593248400),
        Daily(id: 3,
              name: "Спорт",
              description: "После работы зайти в тренажерный зал",
              date_start: 1593266400,
              date_finish: 1593270000),
        Daily(id: 4,
              name: "WWDC",
              description: "Посмотреть WWDC 2020",
              date_start: 1593187200,
              date_finish: 1593194400),
        Daily(id: 5,
              name: "Отдых",
              description: "Ловить взглядом муху",
              date_start: 1593511200,
              date_finish: 1593514800),
        Daily(id: 6,
              name: "Поход",
              description: "Договориться с друзьями о походе",
              date_start: 1592114400,
              date_finish: 1592118000),
        Daily(id: 7,
              name: "Сон",
              description: "Наелся и спит",
              date_start: 1593194400,
              date_finish: 1593115200)
    ]
        
    static func getDailies() -> [Daily] {
        return dailies
    }
}
