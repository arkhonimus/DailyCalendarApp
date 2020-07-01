//
//  storageManager.swift
//  DailyCalendarApp
//
//  Created by Владислав Клепиков on 01.07.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    static func saveObject(_ place: Daily) {
        try! realm.write {
            realm.add(place)
        }
    }
}
