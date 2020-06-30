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
        return dataDailies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DailyTableViewCell
        var daily = Daily(id: 0,
                          name: "",
                          description: "",
                          date_start: 0,
                          date_finish: 0)
        let DH = DateHandler.shared
        
        let dateStart = DH.timeConverter(time: indexPath.row)
        let dateFinish = DH.timeConverter(time: indexPath.row + 1)
        
        filteredDailies.forEach({
            if DH.setDate(dailyDate: $0.date_start) == dateStart {
                daily = $0
            }
        })
        
        if !isSelectedDate {
            dataDailies[indexPath.row] = daily
        }
        
        cell.dailyName.text = daily.name
        cell.dailyDescription.text = daily.description
        cell.dailyDateStart.text = dateStart
        cell.dailyDateFinish.text = dateFinish
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if dataDailies[indexPath.row].name.count > 0 {
            self.performSegue(withIdentifier: "dailyInfo", sender: self)
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
