# ASValidator

[![CI Status](https://img.shields.io/travis/amitpstu1@gmail.com/ASValidator.svg?style=flat)](https://travis-ci.org/amitpstu1@gmail.com/ASValidator)
[![Version](https://img.shields.io/cocoapods/v/ASValidator.svg?style=flat)](https://cocoapods.org/pods/ASValidator)
[![License](https://img.shields.io/cocoapods/l/ASValidator.svg?style=flat)](https://cocoapods.org/pods/ASValidator)
[![Platform](https://img.shields.io/cocoapods/p/ASValidator.svg?style=flat)](https://cocoapods.org/pods/ASValidator)

## Example

```swift
import SValidator


let validator = ASValidator()
textField.addField(svalidator: validator, defaultErrorMsg: nil, rules: [ASVRequiredRule(errorMsg: nil)])


extension UITextField {
    func addField(svalidator: ASValidator?, defaultErrorMsg: String?, rules: [ASVRule]?) {
        register(
            svalidator: svalidator,
            field: self,
            errorLabel: nil,
            errorBorderView: self,
            errorBorderColor: .red,
            normalBorderColor: .gray,
            defaultErrorMsg: defaultErrorMsg,
            borderWidth: 1.0,
            rules: rules
        )
    }
}
```

## Requirements

## Installation

ASValidator is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ASValidator'
```

## Author

Amit Mondol, amitpstu1@gmail.com

## License

ASValidator is available under the MIT license. See the LICENSE file for more info.
