//
//  DailyInfoViewController.swift
//  DailyCalendarApp
//
//  Created by Владислав Клепиков on 28.06.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import UIKit

class DailyInfoViewController: UIViewController {
    @IBOutlet weak var dailyInfoName: UILabel!
    @IBOutlet weak var dailyInfoDate: UILabel!
    @IBOutlet weak var dailyInfoDescription: UILabel!
    
    var daily: Daily = Daily(id: 0,
                             name: "",
                             description: "",
                             date_start: 0,
                             date_finish: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(daily)
    }

}
