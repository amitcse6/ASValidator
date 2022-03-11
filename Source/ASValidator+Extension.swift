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
        errorProps: ASVErrorProps?,
        sender: Any?,
        tag: String?
    ) -> ASValidatorEntity? {
        if let svalidator = svalidator {
            let entity = ASValidatorEntity(
                field: field,
                name: name,
                errorLabel: errorLabel,
                errorBorderView: errorBorderView,
                errorBorderColor: errorBorderColor,
                normalBorderColor: normalBorderColor,
                defaultErrorMsg: defaultErrorMsg,
                borderWidth: borderWidth,
                rules: rules,
                errorProps: errorProps,
                sender: sender,
                tag: tag
            )
            svalidator.append(entity)
            return entity
        }
        return nil
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
        errorProps: ASVErrorProps?,
        sender: Any?,
        tag: String?
    ) -> ASValidatorEntity? {
        if let svalidator = svalidator {
            let entity = ASValidatorEntity(
                field: field,
                name: name,
                errorLabel: errorLabel,
                errorBorderView: errorBorderView,
                errorBorderColor: errorBorderColor,
                normalBorderColor: normalBorderColor,
                defaultErrorMsg: defaultErrorMsg,
                borderWidth: borderWidth,
                rules: rules,
                errorProps: errorProps,
                sender: sender,
                tag: tag
            )
            svalidator.append(entity)
            return entity
        }
        return nil
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
        errorProps: ASVErrorProps?,
        sender: Any?,
        tag: String?
    ) -> ASValidatorEntity? {
        if let svalidator = svalidator {
            let entity = ASValidatorEntity(
                field: field,
                name: name,
                errorLabel: errorLabel,
                errorBorderView: errorBorderView,
                errorBorderColor: errorBorderColor,
                normalBorderColor: normalBorderColor,
                defaultErrorMsg: defaultErrorMsg,
                borderWidth: borderWidth,
                rules: rules,
                errorProps: errorProps,
                sender: sender,
                tag: tag
            )
            svalidator.append(entity)
            return entity
        }
        return nil
    }
}

extension UILabel {
    public func registerASVTF(
        svalidator: ASValidator?,
        field: UILabel?,
        name: String?,
        errorLabel: UILabel?,
        errorBorderView: UIView?,
        errorBorderColor: CGColor?,
        normalBorderColor: CGColor?,
        defaultErrorMsg: String?,
        borderWidth: CGFloat?,
        rules: [ASVRule]?,
        errorProps: ASVErrorProps?,
        sender: Any?,
        tag: String?
    ) -> ASValidatorEntity? {
        if let svalidator = svalidator {
            let entity = ASValidatorEntity(
                field: field,
                name: name,
                errorLabel: errorLabel,
                errorBorderView: errorBorderView,
                errorBorderColor: errorBorderColor,
                normalBorderColor: normalBorderColor,
                defaultErrorMsg: defaultErrorMsg,
                borderWidth: borderWidth,
                rules: rules,
                errorProps: errorProps,
                sender: sender,
                tag: tag
            )
            svalidator.append(entity)
            return entity
        }
        return nil
    }
}

extension UITextView {
    public func registerASVTF(
        svalidator: ASValidator?,
        field: UITextView?,
        name: String?,
        errorLabel: UILabel?,
        errorBorderView: UIView?,
        errorBorderColor: CGColor?,
        normalBorderColor: CGColor?,
        defaultErrorMsg: String?,
        borderWidth: CGFloat?,
        rules: [ASVRule]?,
        errorProps: ASVErrorProps?,
        sender: Any?,
        tag: String?
    ) -> ASValidatorEntity? {
        if let svalidator = svalidator {
            let entity = ASValidatorEntity(
                field: field,
                name: name,
                errorLabel: errorLabel,
                errorBorderView: errorBorderView,
                errorBorderColor: errorBorderColor,
                normalBorderColor: normalBorderColor,
                defaultErrorMsg: defaultErrorMsg,
                borderWidth: borderWidth,
                rules: rules,
                errorProps: errorProps,
                sender: sender,
                tag: tag
            )
            svalidator.append(entity)
            return entity
        }
        return nil
    }
}
