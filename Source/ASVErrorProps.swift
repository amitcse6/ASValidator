//
//  ASVErrorBorderProps.swift
//  Gonzo
//
//  Created by AMIT on 1/30/22.
//

import Foundation
import UIKit

public class ASVErrorProps {
    public var views: [UIView?]?
    public var view: UIView?
    public var label: UILabel?
    public var normalBorderColor: UIColor? = .white
    public var errorBorderColor: UIColor? = .red
    public var normalErrorTextColor: UIColor? = .black
    public var errorErrorTextColor: UIColor? = .red
    public var otherBorderHilighted = true
    
    public init(_ view: UIView?, _ label: UILabel?) {
        self.view = view
        self.label = label
        self.normalBorderColor = UIColor(cgColor: view?.layer.borderColor ?? UIColor.white.cgColor)
        self.normalErrorTextColor = label?.textColor
    }
    
    public init(_ view: UIView?, _ label: UILabel?, _ normalBorderColor: UIColor?) {
        self.view = view
        self.label = label
        self.normalBorderColor = normalBorderColor
        self.normalErrorTextColor = label?.textColor
    }
    
    public init(_ views: [UIView?]?, _ label: UILabel?, _ normalBorderColor: UIColor?, _ sender: Any?) {
        self.views = views
        self.label = label
        self.normalBorderColor = normalBorderColor
        self.normalErrorTextColor = label?.textColor
    }
    
    public init(_ view: UIView?, _ label: UILabel?, _ normalBorderColor: UIColor?, _ normalErrorTextColor: UIColor?) {
        self.view = view
        self.label = label
        self.normalBorderColor = normalBorderColor
        self.normalErrorTextColor = normalErrorTextColor
    }
    
    public init(_ view: UIView, _ label: UILabel?, _ normalBorderColor: UIColor?, _ normalErrorTextColor: UIColor?) {
        self.view = view
        self.label = label
        self.normalBorderColor = normalBorderColor
        self.normalErrorTextColor = normalErrorTextColor
    }
    
    public init(_ view: UIView?, _ label: UILabel?, _ normalBorderColor: UIColor? = .white, _ errorBorderColor: UIColor? = .red, _ normalErrorTextColor: UIColor? = .white, _ errorErrorTextColor: UIColor? = .red) {
        self.view = view
        self.label = label
        self.normalBorderColor = normalBorderColor
        self.errorBorderColor = errorBorderColor
        self.normalErrorTextColor = normalErrorTextColor
        self.errorErrorTextColor = errorErrorTextColor
    }
}
