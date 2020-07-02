//
//  DailyModel.swift
//  DailyCalendarApp
//
//  Created by Владислав Клепиков on 27.06.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import RealmSwift

class Daily: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var descriptionDaily = ""
    @objc dynamic var date_start: Int = 0
    @objc dynamic var date_finish: Int = 0
    
    convenience init(id: Int,
                     name: String,
                     descriptionDaily: String,
                     date_start: Int,
                     date_finish: Int) {
        self.init()
        self.id = id
        self.name = name
        self.descriptionDaily = descriptionDaily
        self.date_start = date_start
        self.date_finish = date_finish
    }
}
