//
//  ViewController.swift
//  DailyCalendarApp
//
//  Created by Владислав Клепиков on 27.06.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import UIKit
import FSCalendar
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var tableView: UITableView!
    
    var isSelectedDate: Bool = true
    
    var dailies: Results<Daily>!
    var filteredDailies: [Daily] = [Daily]()
    var dataDailies = Array(repeating: Daily(id: 0,
                                             name: "",
                                             descriptionDaily: "",
                                             date_start: 0,
                                             date_finish: 0), count: 24)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dailies = realm.objects(Daily.self)

        calendar.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dailyInfo" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dailyInfo = segue.destination as! DailyInfoViewController
                dailyInfo.daily = dataDailies[indexPath.row]
            }
        }
    }
}
