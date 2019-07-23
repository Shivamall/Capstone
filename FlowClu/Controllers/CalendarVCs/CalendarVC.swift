
import JTAppleCalendar
import UIKit


class CalendarVC: UIViewController {

    @IBOutlet weak var calendarView: JTAppleCalendarView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
//        period tacking logic
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        //        period tacking logic ends
        
        
        calendarView.scrollDirection = .horizontal
        calendarView.scrollingMode   = .stopAtEachCalendarFrame
        calendarView.showsHorizontalScrollIndicator = false
    }
        //     Fix the inDates/outDates/monthDates
    
        func configureCell(view: JTAppleCell?, cellState: CellState) {
            guard let cell = view as? DateCell  else { return }
            cell.dateLabel.text = cellState.text
            handleCellTextColor(cell: cell, cellState: cellState)
            handleCellSelected(cell: cell, cellState: cellState)

        }
        
        func handleCellTextColor(cell: DateCell, cellState: CellState) {
            if cellState.dateBelongsTo == .thisMonth {
                cell.dateLabel.textColor = UIColor.black
            } else {
                cell.dateLabel.textColor = UIColor.gray
            }
        }
    
    func handleCellSelected(cell: DateCell, cellState: CellState) {
        if cellState.isSelected {
            cell.selectedView.layer.cornerRadius =  13
            cell.selectedView.backgroundColor = UIColor.red
//            cell.selectedView.isHidden = false
        } else {
//            cell.selectedView.isHidden = true
        }
    }

        
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(view: cell, cellState: cellState)
    }
    
    
    

    
    
}
    
    
   


extension CalendarVC: JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        let startDate = Date()
        let endDate = Date()
        return ConfigurationParameters(startDate: startDate,
                                       endDate: endDate,
                                       generateInDates: .forAllMonths,
                                       generateOutDates: .tillEndOfGrid)
    }
}


extension CalendarVC: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let myCustomCell = calendar.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath) as! DateCell
        self.calendar(calendar, willDisplay: myCustomCell, forItemAt: date, cellState: cellState, indexPath: indexPath)
        
        return myCustomCell
    }
    
    
        func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
            // This function should have the same code as the cellForItemAt function
            let myCustomCell = cell as! DateCell
            myCustomCell.dateLabel.text = cellState.text
//            if Calendar.isDateInToday(date) {
//                myCustomCell.backgroundColor = red
//            } else {
//                myCustomCell.backgroundColor = white
//            }        }
//
    

    
    }
    
    
    func calendar(_ calendar: JTAppleCalendarView, shouldSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) -> Bool {
        return true // Based on a criteria, return true or false
    }

    func calendar(_ calendar: JTAppleCalendarView, headerViewForDateRange range: (start: Date, end: Date), at indexPath: IndexPath) -> JTAppleCollectionReusableView {
        let formatter = DateFormatter()  // Declare this outside, to avoid instancing this heavy class multiple times.
        formatter.dateFormat = "MMM YYYY"
        
        let header = calendar.dequeueReusableJTAppleSupplementaryView(withReuseIdentifier: "DateHeader", for: indexPath) as! DateHeader
        header.monthTitle.text = formatter.string(from: range.start)
        return header
    }
    
    func calendarSizeForMonths(_ calendar: JTAppleCalendarView?) -> MonthSize? {
        return MonthSize(defaultSize: 50)
    }
    
}





