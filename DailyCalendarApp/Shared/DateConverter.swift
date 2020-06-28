//
//  DateConverter.swift
//  DailyCalendarApp
//
//  Created by Владислав Клепиков on 28.06.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import Foundation

class DateConverter {
    static let shared = DateConverter()
    
    private init(){}
    
    func setDate(dailyDate: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(dailyDate))
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "HH.mm"
        
        let dateString = dateFormatterGet.string(from: date)
        
        return dateString
    }
}
