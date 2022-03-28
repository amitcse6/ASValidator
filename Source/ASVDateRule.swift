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
    case minOrEqual
    case maxOrEqual
}

public class ASVDateRule: ASVRule {
    var errorMsg: String?
    var dateValue: String
    var format: String
    var range: ASVDateRange
    
    public init(_ dateValue: String, _ format: String, _ range: ASVDateRange, _ errorMsg: String? = nil) {
        self.dateValue = dateValue
        self.format = format
        self.range = range
        self.errorMsg = errorMsg
    }
    
    public func validate(_ dateString: Any?, _ fieldName: String?, _ defaultErrorMsg: String?) -> ASVError? {
        if let dateString1 = (dateString as? String)?.trimmingCharacters(in: .whitespaces) {
            let date1 = ASVDateRule.getDate(dateString1, format)
            let date2 = ASVDateRule.getDate(dateValue.trimmingCharacters(in: .whitespaces), format)
            if ASVDateRule.compareDateWith(date1, date2, range) {
                return nil
            }
        }
        return ASVError(errorMsg: errorMsg ?? defaultErrorMsg ?? "\(fieldName ?? "") \(ASVDateRule.getRangeStringMessage(range)) \(dateValue)")
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
        case .minOrEqual:
            if date1 > date2 || date1 == date2 {
                return true
            }
        case .maxOrEqual:
            if date1 < date2 || date1 == date2 {
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
        case .minOrEqual:
            return "will be min or equal"
        case .maxOrEqual:
            return "will be Max or equal"
        }
    }
}
