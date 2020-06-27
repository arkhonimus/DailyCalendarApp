//
//  DailyTableViewCell.swift
//  DailyCalendarApp
//
//  Created by Владислав Клепиков on 27.06.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import UIKit

class DailyTableViewCell: UITableViewCell {
    @IBOutlet weak var dailyName: UILabel!
    @IBOutlet weak var dailyDescription: UILabel!
    @IBOutlet weak var dailyDateStart: UILabel!
    @IBOutlet weak var dailyDateFinish: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(daily: Daily) {
        self.dailyName.text = daily.name
        self.dailyDescription.text = daily.description
    }

}
