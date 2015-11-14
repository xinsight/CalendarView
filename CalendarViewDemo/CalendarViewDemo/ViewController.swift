//
//  ViewController.swift
//  CalendarViewDemo
//
//  Created by Nate Armstrong on 5/7/15.
//  Copyright (c) 2015 Nate Armstrong. All rights reserved.
//

import UIKit
import CalendarView
import SwiftMoment

class ViewController: UIViewController {

  @IBOutlet weak var calendar: CalendarView!

  var date: Moment! {
    didSet {
      title = date.format("MMMM d, yyyy")
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    date = moment()
    calendar.delegate = self
    calendar.addTarget(self, action: "calendarChanged:", forControlEvents: .ValueChanged)
  }
  
  func calendarChanged(calendar:CalendarView) {
    let date = calendar.selectedDate()
    NSLog("calendar changed: \(date)")
  }
  
}

extension ViewController: CalendarViewDelegate {

  func calendarDidSelectDate(date: Moment) {
    self.date = date
  }

  func calendarDidPageToDate(date: Moment) {
    self.date = date
  }

}
