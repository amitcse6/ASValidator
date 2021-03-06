# ASValidator

[![CI Status](https://img.shields.io/travis/amitpstu1@gmail.com/ASValidator.svg?style=flat)](https://travis-ci.org/amitpstu1@gmail.com/ASValidator)
[![Version](https://img.shields.io/cocoapods/v/ASValidator.svg?style=flat)](https://cocoapods.org/pods/ASValidator)
[![License](https://img.shields.io/cocoapods/l/ASValidator.svg?style=flat)](https://cocoapods.org/pods/ASValidator)
[![Platform](https://img.shields.io/cocoapods/p/ASValidator.svg?style=flat)](https://cocoapods.org/pods/ASValidator)

Screenshots
---------
![ASValidator Screenshots](asvalidator_screenshot.gif)

## Example 1:
```swift
// Import
import SValidator

// Add A Validation
let svalidator = ASValidator()
textField.register(svalidator: validator, defaultErrorMsg: nil, rules: [ASVRequiredRule(nil), ASVMinLengthRule(2), ASVMaxLengthRule(5, nil)])

// Validation Check
let validate = asValidator.apply()
if let validate = validate, validate.isValid() {
    // MARK: - Validation Success
}else{
    // MARK: - Validation Fail
}
```


## Example 2: for Effeciently Use

```swift
textField.addField(svalidator: svalidator, defaultErrorMsg: nil, rules: [ASVRequiredRule(errorMsg: nil)])

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

## Validation Rule
```swift
ASVRequiredRule(nil)
ASVMinLengthRule(2)
ASVMaxLengthRule(5, nil)
...
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
