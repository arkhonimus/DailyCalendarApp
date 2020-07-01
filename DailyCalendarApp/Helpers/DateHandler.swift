//
//  DateHandler.swift
//  DailyCalendarApp
//
//  Created by Владислав Клепиков on 28.06.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import Foundation

class DateHandler {
    static let shared = DateHandler()
    
    private init(){}
    
    func setDate(dailyDate: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(dailyDate))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
    
    func timeConverter(time: Int) -> String {
        if "\(time)".count > 1 {
            if time == 24 {
                return "00"
            } else {
                return "\(time)"
            }
        } else {
            return "0\(time)"
        }
    }
}
