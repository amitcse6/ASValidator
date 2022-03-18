//
//  ASVDateRule.swift
//  ASValidator
//
//  Created by AMIT on 3/18/22.
//

import Foundation

public enum ASVDateRange: String {
    case min
    case max
    case equal
}

public class ASVDateRule: ASVRule {
    var errorMsg: String?
    var date: Date
    var format: String
    var range: ASVDateRange
    
    public init(_ date: Date, _ format: String, _ range: ASVDateRange, _ errorMsg: String? = nil) {
        self.date = date
        self.format = format
        self.range = range
        self.errorMsg = errorMsg
    }
    
    public func validate(_ stringDate: Any?, _ fieldName: String?, _ defaultErrorMsg: String?) -> ASVError? {
        if let stringDate = (stringDate as? String)?.trimmingCharacters(in: .whitespaces), stringDate.count > 0 {
            let _date = ASVDateRule.getDate(stringDate, format)
            if ASVDateRule.compareDateWith(_date, date, range) {
                return nil
            }
        }
        return ASVError(errorMsg: errorMsg ?? defaultErrorMsg ?? "\(fieldName ?? "") \(ASVDateRule.getRangeStringMessage(range)) \(date)")
    }
}

extension ASVDateRule {
    static func compareDateWith(_ date1: Date, _ date2: Date, _ range: ASVDateRange) -> Bool {
        switch(range) {
        case .min:
            if date1 > date2 {
                return true
            }
        case .max:
            if date1 < date2 {
                return true
            }
        case .equal:
            if date1 == date2 {
                return true
            }
        }
        return false
    }

    static func getDate(_ stringDate: String?, _ format: String? = nil) -> Date {
        guard let stringDate = stringDate else {return Date()}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: stringDate) else { return Date() }
        return date
    }

    static func getRangeStringMessage(_ range: ASVDateRange) -> String {
        switch(range) {
        case .min:
            return "will be minimum"
        case .max:
            return "will be maximum"
        case .equal:
            return "will be equal"
        }
    }
}
