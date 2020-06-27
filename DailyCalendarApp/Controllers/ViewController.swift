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
    
    let dailiesList = Daily.getDailies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.delegate = self
        tableView.tableFooterView = UIView()
    }


}

extension ViewController: FSCalendarDataSource, FSCalendarDelegate {
//    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
//        return "Hello"
//    }
//
//    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
//        return "world"
//    }
//
//    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
//        let cell = calendar.dequeueReusableCell(withIdentifier: "CELL", for: date, at: position)
//
//        return cell
//    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
        let selectDate = Int(date.timeIntervalSince1970)
//        let dateFormatter = DateFormatter()
        
        print(selectDate)
        
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        print(date)
        return 3
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailiesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DailyTableViewCell
        let daily: Daily
        
        daily = dailiesList[indexPath.row]
        cell.set(daily: daily)
        
        return cell
    }
}
