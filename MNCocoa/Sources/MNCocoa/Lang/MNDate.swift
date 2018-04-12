//
//  MNDate.swift
//  NextCont
//
//  Created by 陆广庆 on 2017/5/23.
//  Copyright © 2017年 陆广庆. All rights reserved.
//

#if os(OSX)
    import Cocoa
#elseif os(iOS)
    import UIKit
#endif

public extension Date {

    public func isSameDay(date: Date) -> Bool {
        let y = date.year
        let m = date.month
        let d = date.days
        return y == year && m == month && d == days
    }

    public static func formatUTC(_ utcString: String) -> Date {
        if utcString.isEmpty {
            return Date()
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let localDate = formatter.date(from: utcString) {
            return localDate
        }
        return Date()
    }

    public func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    public var millisSecondSince1970: Double {
        let ms = self.timeIntervalSince1970
        return ms * 1000
    }

    public var secondSince1970: Double {
        let s = self.timeIntervalSince1970
        return s
    }
}

public extension Date {

    // MARK: - NSDate Manipulation

    /**
     Returns a new NSDate object representing the date calculated by adding the amount specified to self date
     
     - parameter seconds: number of seconds to add
     - parameter minutes: number of minutes to add
     - parameter hours: number of hours to add
     - parameter days: number of days to add
     - parameter weeks: number of weeks to add
     - parameter months: number of months to add
     - parameter years: number of years to add
     - returns: the NSDate computed
     */
    public func add(_ seconds: Int = 0, minutes: Int = 0, hours: Int = 0, days: Int = 0, weeks: Int = 0, months: Int = 0, years: Int = 0) -> Date {
        let calendar = Calendar.current
        let version = floor(NSFoundationVersionNumber)
        if (version <= NSFoundationVersionNumber10_9_2  ) {
            var component = DateComponents()

            (component as NSDateComponents).setValue(seconds, forComponent: .second)
            var date : Date! = (calendar as NSCalendar).date(byAdding: component, to: self, options: [])!
            component = DateComponents()
            (component as NSDateComponents).setValue(minutes, forComponent: .minute)
            date = (calendar as NSCalendar).date(byAdding: component, to: date, options: [])!

            component = DateComponents()
            (component as NSDateComponents).setValue(hours, forComponent: .hour)
            date = (calendar as NSCalendar).date(byAdding: component, to: date, options: [])!

            component = DateComponents()
            (component as NSDateComponents).setValue(days, forComponent: .day)
            date = (calendar as NSCalendar).date(byAdding: component, to: date, options: [])!

            component = DateComponents()
            (component as NSDateComponents).setValue(weeks, forComponent: .weekOfMonth)
            date = (calendar as NSCalendar).date(byAdding: component, to: date, options: [])!

            component = DateComponents()
            (component as NSDateComponents).setValue(months, forComponent: .month)
            date = (calendar as NSCalendar).date(byAdding: component, to: date, options: [])!

            component = DateComponents()
            (component as NSDateComponents).setValue(years, forComponent: .year)
            date = (calendar as NSCalendar).date(byAdding: component, to: date, options: [])!
            return date
        }

        var date : Date! = (calendar as NSCalendar).date(byAdding: .second, value: seconds, to: self, options: [])
        date = (calendar as NSCalendar).date(byAdding: .minute, value: minutes, to: date, options: [])
        date = (calendar as NSCalendar).date(byAdding: .day, value: days, to: date, options: [])
        date = (calendar as NSCalendar).date(byAdding: .hour, value: hours, to: date, options: [])
        date = (calendar as NSCalendar).date(byAdding: .weekOfMonth, value: weeks, to: date, options: [])
        date = (calendar as NSCalendar).date(byAdding: .month, value: months, to: date, options: [])
        date = (calendar as NSCalendar).date(byAdding: .year, value: years, to: date, options: [])
        return date
    }

    /**
     Returns a new NSDate object representing the date calculated by adding an amount of seconds to self date
     
     - parameter seconds: number of seconds to add
     - returns: the NSDate computed
     */
    public func addSeconds (_ seconds: Int) -> Date {
        return add(seconds)
    }

    /**
     Returns a new NSDate object representing the date calculated by adding an amount of minutes to self date
     
     - parameter minutes: number of minutes to add
     - returns: the NSDate computed
     */
    public func addMinutes (_ minute: Int) -> Date {
        return add(minutes: minute)
    }

    /**
     Returns a new NSDate object representing the date calculated by adding an amount of hours to self date
     
     - parameter hours: number of hours to add
     - returns: the NSDate computed
     */
    public func addHours(_ hours: Int) -> Date {
        return add(hours: hours)
    }

    /**
     Returns a new NSDate object representing the date calculated by adding an amount of days to self date
     
     - parameter days: number of days to add
     - returns: the NSDate computed
     */
    public func addDays(_ days: Int) -> Date {
        return add(days: days)
    }

    /**
     Returns a new NSDate object representing the date calculated by adding an amount of weeks to self date
     
     - parameter weeks: number of weeks to add
     - returns: the NSDate computed
     */
    public func addWeeks(_ weeks: Int) -> Date {
        return add(weeks: weeks)
    }

    /**
     Returns a new NSDate object representing the date calculated by adding an amount of months to self date
     
     - parameter months: number of months to add
     - returns: the NSDate computed
     */

    public func addMonths(_ months: Int) -> Date {
        return add(months: months)
    }

    /**
     Returns a new NSDate object representing the date calculated by adding an amount of years to self date
     
     - parameter years: number of year to add
     - returns: the NSDate computed
     */
    public func addYears(_ years: Int) -> Date {
        return add(years: years)
    }

    // MARK: - Date comparison

    /**
     Checks if self is after input NSDate
     
     - parameter date: NSDate to compare
     - returns: True if self is after the input NSDate, false otherwise
     */
    public func isAfter(_ date: Date) -> Bool {
        return (self.compare(date) == ComparisonResult.orderedDescending)
    }

    /**
     Checks if self is before input NSDate
     
     - parameter date: NSDate to compare
     - returns: True if self is before the input NSDate, false otherwise
     */
    public func isBefore(_ date: Date) -> Bool {
        return (self.compare(date) == ComparisonResult.orderedAscending)
    }

    // MARK: - Getter

    /**
     Date year
     */
    public var year : Int {
        return getComponent(.year)
    }

    /**
     Date month
     */
    public var month : Int {
        return getComponent(.month)
    }

    /**
     Date weekday
     */
    public var weekday : Int {
        return getComponent(.weekday)
    }

    /**
     Date weekMonth
     */
    public var weekMonth : Int {
        return getComponent(.weekOfMonth)
    }

    /**
     Date days
     */
    public var days : Int {
        return getComponent(.day)
    }

    /**
     Date hours
     */
    public var hours : Int {
        return getComponent(.hour)
    }

    /**
     Date minuts
     */
    public var minutes : Int {
        return getComponent(.minute)
    }

    /**
     Date seconds
     */
    public var seconds : Int {
        return getComponent(.second)
    }

    /**
     Returns the value of the NSDate component
     
     - parameter component: NSCalendarUnit
     - returns: the value of the component
     */

    public func getComponent (_ component : Calendar.Component) -> Int {
        let calendar = Calendar.current
        let components = calendar.component(component, from: self)
        return components
    }
}
