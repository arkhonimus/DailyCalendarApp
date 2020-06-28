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
    
    let dailies = Daily.getDailies()
    var filteredDailies = [Daily]()
    var isSelectedDate = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dailyInfo" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dailyInfo = segue.destination as! DailyInfoViewController
                dailyInfo.daily = dailies[indexPath.row]
            }
        }
    }
}
