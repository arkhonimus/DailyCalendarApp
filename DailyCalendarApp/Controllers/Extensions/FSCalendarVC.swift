//
//  FSCalendarVCExtensions.swift
//  DailyCalendarApp
//
//  Created by Владислав Клепиков on 27.06.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import UIKit
import FSCalendar

extension ViewController: FSCalendarDataSource, FSCalendarDelegate {
//    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
//        return "Hello"
//    }
//
//    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
//        return "world"
//    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        isSelectedDate = true
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let selectDate = dateFormatterGet.string(from: date)

        filterDailiesForCalendar(selectDate, dailies: dailies)
        isSelectedDate = false
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return 1
    }
    
    func filterDailiesForCalendar(_ selectDate: String, dailies: [Daily]) {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        filteredDailies = dailies.filter({ dateFormatterGet.string(from: Date(timeIntervalSince1970: TimeInterval($0.date_start))) == selectDate })
        
        tableView.reloadData()
    }

}
