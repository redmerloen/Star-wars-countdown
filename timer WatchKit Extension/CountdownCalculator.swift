//
//  CountdownCalculator.swift
//  timer
//
//  Created by Redmer Loen on 20-10-15.
//  Copyright © 2015 Redmer Loen. All rights reserved.
//

import Foundation

public class CountdownCalculator
{
    var targetDateTime:String = "2015-12-18 12:00:00"
    var targetName = "Star Wars VII Release"

    let SECONDS_PER_HOUR = 3600
    let SECONDS_PER_MINUTE = 60
    let SECONDS_PER_DAY = 86400

    func DaysFromSeconds(remainingSeconds:Double) -> Int {
        return Int(remainingSeconds) / SECONDS_PER_DAY
    }

    func DateFromString(dateStr:String, format:String="yyyy-MM-dd HH:mm:ss") -> NSDate {
        let dateFmt = NSDateFormatter()
        dateFmt.timeZone = NSTimeZone.defaultTimeZone()
        dateFmt.dateFormat = format
        return dateFmt.dateFromString(dateStr)!
    }

    func RemainingSeconds() -> Double {
        let now = NSDate()
        let target = DateFromString(targetDateTime)
        let remaining = target.timeIntervalSinceDate(now)
        return remaining
    }

    func RemainingDays() -> (days: Int, daysStr: String) {
        let remaingDays = DaysFromSeconds(RemainingSeconds())

        var daysStr = "Day"
        if (remaingDays != 1) {
            daysStr += "s"
        }

        return (remaingDays, daysStr)
    }

    func RemaingDaysHoursMinutes() -> (days: Int, hours: Int, minutes: Int, seconds: Int, daysStr: String, hoursStr: String, minutesStr: String, secondsStr: String) {
        let hours:Int = (Int(RemainingSeconds()) % SECONDS_PER_DAY) / SECONDS_PER_HOUR
        let minutes:Int = ((Int(RemainingSeconds()) % SECONDS_PER_DAY) % SECONDS_PER_HOUR) / 60
        let seconds:Int = Int(RemainingSeconds()) % 60

        var hoursStr = "Hour"
        if (hours != 1) {
            hoursStr += "s"
        }

        var minutesStr = "Minute"
        if (minutes != 1) {
            minutesStr += "s"
        }

        var secondsStr = "Second"
        if (seconds != 1) {
            secondsStr += "s"
        }

        return (RemainingDays().days, hours, minutes, seconds, RemainingDays().daysStr, hoursStr, minutesStr, secondsStr)
    }
}