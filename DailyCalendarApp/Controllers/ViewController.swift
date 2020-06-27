//
//  ViewController.swift
//  DailyCalendarApp
//
//  Created by Владислав Клепиков on 27.06.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {
 
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var tableView: UITableView!
    
    var dailiesList = Daily.getDailies()
    var filterDaily = Daily.getDailies()
    var isFilter = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.delegate = self
        tableView.tableFooterView = UIView()
    }


}

// MARK: FSCalendar
extension ViewController: FSCalendarDataSource, FSCalendarDelegate {
//    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
//        return "Hello"
//    }
//
//    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
//        return "world"
//    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        isFilter = false
        let selectedDate = Int(date.timeIntervalSince1970)
        let obrDate = Date(timeIntervalSince1970: TimeInterval(selectedDate))
        
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        let Date2 = dateFormatterGet.string(from: date)
        let dDate = dateFormatterGet.string(from: obrDate)
        
//        if Date2 == dDate {
//            print("hello")
//        }
        
//        print(dDate)
        
        let test1 = dateFormatterGet.string(from: Date(timeIntervalSince1970: TimeInterval(1592996400)))
        let test2 = dateFormatterGet.string(from: date)
        print(test1)
        print(test2)
        
        if test1 == test2 {
            print("Hello")
        }

        filterContent(test2, dailies: dailiesList)
        isFilter = true
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return 1
    }
    
    func filterContent(_ selectDate: String, dailies: [Daily]) {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        
        filterDaily = dailies.filter({ dateFormatterGet.string(from: Date(timeIntervalSince1970: TimeInterval($0.date_start))) == selectDate })
        
        tableView.reloadData()
    }

}

// MARK: TableView
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFilter ? dailiesList.count : filterDaily.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DailyTableViewCell
        let daily: Daily
        
//        daily = dailiesList[indexPath.row]
        
        if isFilter {
            daily = filterDaily[indexPath.row]
        } else {
            daily = dailiesList[indexPath.row]
        }
        
        cell.set(daily: daily)
        
        return cell
    }
}
