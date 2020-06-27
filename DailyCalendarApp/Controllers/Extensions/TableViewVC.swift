//
//  TableViewVC.swift
//  DailyCalendarApp
//
//  Created by Владислав Клепиков on 27.06.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import UIKit

// MARK: TableView
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSelectedDate ? filteredDailies.count : dailies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DailyTableViewCell
        let daily: Daily
                
        isSelectedDate ? (daily = dailies[indexPath.row]) : (daily = filteredDailies[indexPath.row])
        
        cell.set(daily: daily)
        
        return cell
    }
}
