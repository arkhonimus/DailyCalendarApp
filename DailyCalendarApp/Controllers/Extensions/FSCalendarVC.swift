//
//  FSCalendarVCExtensions.swift
//  DailyCalendarApp
//
//  Created by Владислав Клепиков on 27.06.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import UIKit
import FSCalendar
import RealmSwift

extension ViewController: FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        isSelectedDate = true
        
        let selectDate = setDateFormatter(date: date)

        filterDailiesForCalendar(selectDate: selectDate)
        
        isSelectedDate = false
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return 1
    }
        
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateString = setDateFormatter(date: date)
        let eventDate = filterDailiesListDate(selectDate: dateString)
        
        if eventDate.count > 0 {
            cell.eventIndicator.isHidden = false
            cell.eventIndicator.color = UIColor.blue
            
            cell.eventIndicator.numberOfEvents = eventDate.count
            cell.numberOfEvents = eventDate.count
        }
    }
    
        
    func filterDailiesForCalendar(selectDate: String) {
        eventsOfSelectedDay = filterDailiesListDate(selectDate: selectDate)
        tableView.reloadData()
    }

    func filterDailiesListDate(selectDate: String) -> [Daily] {
        let sortedDailiesList = dailies.filter({
            let date = Date(timeIntervalSince1970: TimeInterval($0.date_start))
            
            return self.setDateFormatter(date: date) == selectDate
        })
        
        let result = Array(sortedDailiesList)
        
        return result
    }

    func setDateFormatter(date: Date) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        return dateFormatterGet.string(from: date)
    }
}
