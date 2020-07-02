//
//  NewDailyViewController.swift
//  DailyCalendarApp
//
//  Created by Владислав Клепиков on 01.07.2020.
//  Copyright © 2020 Vladislav Klepikov. All rights reserved.
//

import UIKit
import RealmSwift

class NewDailyViewController: UIViewController {

    @IBOutlet weak var nameDaily: UITextField!
    @IBOutlet weak var descriptionDaily: UITextField!
    @IBOutlet weak var dateDaily: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var newDaily = Daily(id: 0,
                         name: "",
                         descriptionDaily: "",
                         date_start: 0,
                         date_finish: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSaveButtonState()
    }
    @IBAction func cancelButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveNewDaily(_ sender: Any) {
        let DH = DateHandler.shared
        let date = DH.setDate(dailyDate: Int(self.dateDaily.date.timeIntervalSince1970 ))
        let isTimeInData = realm.objects(Daily.self).filter({ DH.setDate(dailyDate: $0.date_start) == date}).first
        
        if (isTimeInData?.name.count) != nil {
            showAlert(title: "Событие на данное время уже существует", message: "")
        } else {
            addNewDailyAction()
            dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    private func addNewDailyAction() {
        var newDailyID = realm.objects(Daily.self).map({$0.id}).max() ?? 0
        newDailyID = newDailyID + 1
        
        newDaily.id = newDailyID
        newDaily.name = nameDaily.text ?? ""
        newDaily.descriptionDaily = descriptionDaily.text ?? ""
        newDaily.date_start = Int(dateDaily.date.timeIntervalSince1970)
        newDaily.date_finish = Int(dateDaily.date.timeIntervalSince1970 + 3600)
        
        StorageManager.saveObject(newDaily)
    }
    
    private func updateSaveButtonState() {
        let nameText = nameDaily.text ?? ""
        let descriptionText = descriptionDaily.text ?? ""
        
        saveButton.isEnabled = !nameText.isEmpty && !descriptionText.isEmpty
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Закрыть", style: .default)
        
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}
