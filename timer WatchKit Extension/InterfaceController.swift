//
//  InterfaceController.swift
//  timer WatchKit Extension
//
//  Created by Redmer Loen on 19-10-15.
//  Copyright © 2015 Redmer Loen. All rights reserved.
//

import WatchKit
import UIKit
import Foundation

var date = NSDate();

class InterfaceController: WKInterfaceController {

    @IBOutlet var remainingTimeLabel: WKInterfaceLabel!

    let thisCountdown = CountdownCalculator()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)


        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()

    }

    override func didAppear() {

        updateDisplay()
        var displayTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateDisplay"), userInfo: nil, repeats: true)

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }


    func updateDisplay() {
        remainingTimeLabel.setText(String(thisCountdown.RemainingDays().days))
        var rt = thisCountdown.RemaingDaysHoursMinutes()

        var unitsString: String = String(rt.days) + " " + rt.daysStr + "\n"
        unitsString += String(rt.hours) + " " + rt.hoursStr + "\n"
        unitsString += String(rt.minutes) + " " + rt.minutesStr + "\n"
        unitsString += String(rt.seconds) + " " + rt.secondsStr

        remainingTimeLabel.setText(unitsString)
    }


}
