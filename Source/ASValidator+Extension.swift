//
//  ASValidator+Extension.swift
//  ASValidator
//
//  Created by AMIT on 11/12/20.
//

import Foundation
import UIKit

extension UITextField {
    public func registerASVTF(
        svalidator: ASValidator?,
        field: UITextField?,
        name: String?,
        errorLabel: UILabel?,
        errorBorderView: UIView?,
        errorBorderColor: CGColor?,
        normalBorderColor: CGColor?,
        defaultErrorMsg: String?,
        borderWidth: CGFloat?,
        rules: [ASVRule]?,
        errorProps: ASVErrorProps?
    ) {
        if let svalidator = svalidator {
            svalidator.append(ASValidatorEntity(
                field: field,
                name: name,
                errorLabel: errorLabel,
                errorBorderView: errorBorderView,
                errorBorderColor: errorBorderColor,
                normalBorderColor: normalBorderColor,
                defaultErrorMsg: defaultErrorMsg,
                borderWidth: borderWidth,
                rules: rules,
                errorProps: errorProps
            ))
        }
    }
}

extension UIButton {
    public func registerASVTF(
        svalidator: ASValidator?,
        field: UIButton?,
        name: String?,
        errorLabel: UILabel?,
        errorBorderView: UIView?,
        errorBorderColor: CGColor?,
        normalBorderColor: CGColor?,
        defaultErrorMsg: String?,
        borderWidth: CGFloat?,
        rules: [ASVRule]?,
        errorProps: ASVErrorProps?
    ) {
        if let svalidator = svalidator {
            svalidator.append(ASValidatorEntity(
                field: field,
                name: name,
                errorLabel: errorLabel,
                errorBorderView: errorBorderView,
                errorBorderColor: errorBorderColor,
                normalBorderColor: normalBorderColor,
                defaultErrorMsg: defaultErrorMsg,
                borderWidth: borderWidth,
                rules: rules,
                errorProps: errorProps
            ))
        }
    }
}

extension UIImageView {
    public func registerASVTF(
        svalidator: ASValidator?,
        field: UIImageView?,
        name: String?,
        errorLabel: UILabel?,
        errorBorderView: UIView?,
        errorBorderColor: CGColor?,
        normalBorderColor: CGColor?,
        defaultErrorMsg: String?,
        borderWidth: CGFloat?,
        rules: [ASVRule]?,
        errorProps: ASVErrorProps?
    ) {
        if let svalidator = svalidator {
            svalidator.append(ASValidatorEntity(
                field: field,
                name: name,
                errorLabel: errorLabel,
                errorBorderView: errorBorderView,
                errorBorderColor: errorBorderColor,
                normalBorderColor: normalBorderColor,
                defaultErrorMsg: defaultErrorMsg,
                borderWidth: borderWidth,
                rules: rules,
                errorProps: errorProps
            ))
        }
    }
}
