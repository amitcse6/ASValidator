# ASValidator

[![CI Status](https://img.shields.io/travis/amitpstu1@gmail.com/ASValidator.svg?style=flat)](https://travis-ci.org/amitpstu1@gmail.com/ASValidator)
[![Version](https://img.shields.io/cocoapods/v/ASValidator.svg?style=flat)](https://cocoapods.org/pods/ASValidator)
[![License](https://img.shields.io/cocoapods/l/ASValidator.svg?style=flat)](https://cocoapods.org/pods/ASValidator)
[![Platform](https://img.shields.io/cocoapods/p/ASValidator.svg?style=flat)](https://cocoapods.org/pods/ASValidator)

Screenshots
---------
![ASValidator Screenshots](https://raw.githubusercontent.com/amitcse6/ASValidator/master/asvalidator_screenshot.gif)

## Example

```swift
import SValidator

// Validation
let svalidator = ASValidator()
usernameTextField.register(asValidator, usernameErrorLabel,[ASVRequiredRule(), ASVMailRule()], "User name")
usernameTextField.placeholder = "Enter Email Address"
usernameTextField.delegate = self
        
passwordTextField.register(asValidator, passwordErrorLabel, [ASVRequiredRule(), ASVMinLengthRule(6)], "Password")
passwordTextField.placeholder = "Enter Password"
passwordTextField.delegate = self


// Delegate
@available(iOS 10.0, *)
func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
    asValidator.errorResetAll()
}


// for optimization
extension UITextField {
    func register(_ svalidator: ASValidator?, _ errorLabel: UILabel?, _ rules: [ASVRule]?, _ name: String? = nil, _ defaultErrorMsg: String? = nil) {
        registerASVTF(
            svalidator: svalidator,
            field: self,
            name: name,
            errorLabel: errorLabel,
            errorBorderView: self,
            errorBorderColor: UIColor.red.cgColor,
            normalBorderColor: UIColor.lightGray.cgColor,
            defaultErrorMsg: defaultErrorMsg,
            borderWidth: 1.0,
            rules: rules
        )
    }
}
```

## Validation Rule

```swift
textField.register(svalidator: validator, defaultErrorMsg: nil, rules: [ASVRequiredRule(nil), ASVMinLengthRule(2), ASVMaxLengthRule(5, nil)])
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
