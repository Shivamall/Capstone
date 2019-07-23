//
//  calendarEntry.swift
//  FlowClu
//
//  Created by Ashish Ashish on 2019-07-22.
//  Copyright © 2019 Harman Gill. All rights reserved.
//

import Foundation
import UIKit
class calendarEntry: UIViewController{
    
    
    
    
   
    @IBOutlet weak var showDayLabel: UILabel!
    
    @IBOutlet weak var numbersOfDaysLabel: UILabel!
    
    @IBOutlet weak var lengthOfCycleLabel: UILabel!
    
    
    
    
    @IBOutlet weak var showDateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        let today = Date()
        let weekday = Calendar.current.component(.weekday, from: today)
        let month = Calendar.current.component(.month, from: today)
        let date = Calendar.current.component(.day, from: today)
        
        showDateLabel.text = Calendar.current.weekdaySymbols[weekday-1]
        showDayLabel.text = "\(Calendar.current.shortMonthSymbols[month-1]) \(date)"
    }
    
    fileprivate lazy var datePicker: UIDatePicker = { [unowned self] in
        $0.addTarget(self, action: #selector(DatePickerViewController.actionForDatePicker), for: .valueChanged)
        return $0
        }(UIDatePicker())
    
    fileprivate var alertStyle: UIAlertController.Style = .actionSheet

//  Date
    
    @IBAction func selectDate(_ sender: Any) {
        
        let alert = UIAlertController(style: alertStyle, title: "Date Picker", message: "Select Date")
        alert.addDatePicker(mode: .date, date: Date(), minimumDate: nil, maximumDate: nil) { date in
            
//             date converter
//            self.datePicker.datePickerMode = UIDatePicker.Mode.date
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "dd MMMM yyyy"
//            dateFormatter.timeZone = TimeZone(abbreviation: "GMT-07:00")
//            let selectedDate = dateFormatter.string(from: self.datePicker.date)
//            print(selectedDate)
//            let today = Date(iso8601String: selectedDate)
//            print(date)
            
//             date converter ends
            
            let today = date
            let weekday = Calendar.current.component(.weekday, from: today)
            let month = Calendar.current.component(.month, from: today)
            let date = Calendar.current.component(.day, from: today)
//             addind value to mobile
            
             UserDefaults.standard.set(date, forKey: "lastDate")
            
//            adding value to mibile ends
            
            self.showDateLabel.text = Calendar.current.weekdaySymbols[weekday-1]
            self.showDayLabel.text = "\(Calendar.current.shortMonthSymbols[month-1]) \(date)"
        }
        alert.addAction(title: "Done", style: .cancel)
        alert.show()
       
    }
    
//     date ends
    
    
    
    
    
    @IBAction func numberOfDaysAction(_ sender: Any) {
        
//        /  value picker
        
        let alert = UIAlertController(style: self.alertStyle, title: "Picker View", message: "Preferred Content Days")
        
        let frameSizes: [CGFloat] = (1...10).map { CGFloat($0) }
        let pickerViewValues: [[String]] = [frameSizes.map { Int($0).description }]
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: frameSizes.index(of: 1) ?? 1)
        
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
            
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1) {
                    vc.preferredContentSize.height = 150
                }
              
                let noDaysInInt : Int = Int(frameSizes[index.row])
                //             addind value to mobile
                
                UserDefaults.standard.set(noDaysInInt, forKey: "noOfDaysValue")
                
                //            adding value to mibile ends
                self.numbersOfDaysLabel.text = String (noDaysInInt)
                
                
            }
        }
        alert.addAction(title: "Done", style: .cancel)
        alert.show()
        
        
        
        // valie picker
        
    }
    
    
    
    @IBAction func lengthOfCycleAction(_ sender: Any) {
        
//        value picker
        
        let alert = UIAlertController(style: self.alertStyle, title: "Picker View", message: "Preferred Content Days")
        
        let frameSizes: [CGFloat] = (16...45).map { CGFloat($0) }
        let pickerViewValues: [[String]] = [frameSizes.map { Int($0).description }]
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: frameSizes.index(of: 1) ?? 1)
        
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
            
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1) {
                    vc.preferredContentSize.height = 150
                }
                let lengthDaysInInt : Int = Int(frameSizes[index.row])
                //             addind value to mobile
                
                UserDefaults.standard.set(lengthDaysInInt, forKey: "lengthOfDaysValue")
                
                //            adding value to mibile ends
                self.lengthOfCycleLabel.text = String (lengthDaysInInt)
            }
        }
        alert.addAction(title: "Done", style: .cancel)
        alert.show()
        
        
        
        // valie picker
    }
    
    
}


// date picker class






